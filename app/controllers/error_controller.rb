class ErrorController < ApplicationController
  def not_found
    logger.error "Error 404: Page not found"
    render :template => "error/not_found", :layout => false, :status => 404
  end
end
