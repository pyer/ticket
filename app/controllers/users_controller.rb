class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @sub_title = "List of users"
    @users = User.order(login).all
  end

  def login
    authenticate_user if request.post?
  end

  def logout
    User.logoff
    redirect_to home_url
  end
  
  private
  def authenticate_user
    user = User.try_to_login(params[:username], params[:password])
    if user.nil?
      # Invalid credentials
      logger.warn "Failed login for '#{params[:username]}' from #{request.remote_ip} at #{Time.now.utc}"
      flash.now[:error] = "Invalid user or password"
    else
      # Valid user
      logger.info "Successful authentication for '#{user.login}' from #{request.remote_ip} at #{Time.now.utc}"
      redirect_to home_url
    end
  end

end
