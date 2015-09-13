class DashboardsController < ApplicationController
  def index
    @sub_title = "Dashboard"
    @dashboards = Dashboard.all
  end
  
end
