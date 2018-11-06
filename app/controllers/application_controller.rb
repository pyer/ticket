class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private
  def require_login
    logger.info "URL: #{request.original_url}"
    redirect_to home_url if User.current.nil? and request.fullpath != '/' and request.fullpath != '/login'
  end

end
