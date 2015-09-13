class ErrorController < ApplicationController
  def not_found
    logger.error "Error 404: Page not found"
    render :template => "error/not_found", :layout => false, :status => 404
#    respond_to do |format|
#      format.html { render status: 404 }
#    end
#  rescue ActionController::UnknownFormat
#      render status: 404, text: "Unknown !"
  end
end
