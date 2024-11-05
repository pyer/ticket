class HomeController < ApplicationController
  def index
#    redirect_to help_url if User.current.nil?
    @sub_title = "Dashboard"
  end
end
