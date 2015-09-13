class ProjectsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @sub_title = "List of projects"
    @add_item  = '<a href="/projects/new">New project</a>'
    @projects  = Project.all
  end
  
  def new
    project = Project.new( :name => params[:name], :description => params[:description] )
    project.save
  end
  
  def list
  end

end
