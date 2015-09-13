class StatusesController < ApplicationController

  def index
    @sub_title = "List of statuses"
#    @statuses = Status.order(id).all
    @statuses = Status.all

  end
  
end
