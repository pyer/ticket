class IssuesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @sub_title = "List of issues"
    @add_item  = '<a href="/issues/new">New issue</a>'
    @issues    = Issue.all
    #@issues    = Issue.order(:created_on).all
  end

  def new
    @sub_title = "New issue"
    @description, @status, @project_id = Issue.default_values
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit issue ##{@current_id}"
    @description, @status, @project_id = Issue.current_values(@current_id)
  end

  def create
    Issue.create_new(params[:description], params[:status], params[:project_id])
    redirect_to issues_url
  end

  def update
    Issue.update_existing(params[:id], params[:description], params[:status], params[:project_id])
    redirect_to issues_url
  end

  def move
    Issue.update_status(params[:id], params[:status])
#    redirect_to issues_url
  end

end
