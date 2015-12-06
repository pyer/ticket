class DashboardsController < ApplicationController
  def index
    project_name, project_desc = Project.current_values(params[:project])
    @sub_title = "Dashboard of project #{project_name}"
  end
 
end
