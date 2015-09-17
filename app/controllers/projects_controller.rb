class ProjectsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @sub_title  = "List of projects"
    @add_item   = '<a href="/projects/new">New project</a>'
    #@projects  = Project.order(id).all
    @projects   = Project.all
  end
 
  def new
    @sub_title  = "New project"
    logger.debug "--> #{@sub_title}"
  end

  def create
    logger.debug "--> Creating new project"
    project = Project.new
    project.name        = params[:name]
    project.description = params[:description]
    project.created_on  = Time.now
    project.created_by  = User.current.login
    project.save
    redirect_to projects_url
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit project ##{@current_id}"
    logger.debug "--> #{@sub_title}"
  end

  def update
    @current_id = params[:id]
    logger.debug "--> Updating project #{@current_id}"
    project = Project.find(current.to_i)
    if !project.nil?
      project.name        = params[:name]
      project.description = params[:description]
      project.updated_on  = Time.now
      project.updated_by  = User.current.login
      project.save
    end
    redirect_to projects_url
  end

end
