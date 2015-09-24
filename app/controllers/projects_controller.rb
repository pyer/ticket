class ProjectsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @sub_title  = "List of projects"
    @add_item   = '<a href="/projects/new">New project</a>'
    #@projects  = Project.order(id).all
    @projects   = Project.order(:name).all
  end
 
  def new
    @sub_title  = "New project"
    @name, @description = Project.default_values
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit project ##{@current_id}"
    @name, @description = Project.current_values(@current_id)
  end

  def create
    Project.create_new(params[:name], params[:description])
    redirect_to projects_url
  end

  def update
    Project.update_existing(params[:id], params[:name], params[:description])
    redirect_to projects_url
  end

end
