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
    @name, @description = Project.new.default_values
  end

  def create
    project = Project.new
    project.p_create(params[:name], params[:description])
    project.save
    redirect_to projects_url
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit project ##{@current_id}"
    project = Project.find(@current_id.to_i)
    if project.nil?
      @name, @description = Project.new.default_values
    else
      @name, @description = project.current_values
    end
  end

  def update
    @current_id = params[:id]
    project = Project.find(@current_id.to_i)
    if !project.nil?
      project.p_update(params[:name], params[:description])
      project.save
    end
    redirect_to projects_url
  end

end
