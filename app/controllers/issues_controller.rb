class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @sub_title = "List of issues"
    @add_item  = '<a href="/issues/new">New issue</a>'
    @issues    = Issue.all
  end

  def new
    @sub_title = "New issue"
    @description, @color, @status, @project_id = Issue.default_values
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit issue ##{@current_id}"
    @description, @color, @status, @project_id = Issue.current_values(@current_id)
  end

  def create
    Issue.create_new(params[:description], params[:color], params[:status], params[:project_id])
    redirect_to issues_url
  end

  def update
    Issue.update_existing(params[:id], params[:description], params[:color], params[:status], params[:project_id])
    redirect_to issues_url
  end

  def move
    st = helpers.status_name(params[:status])
    Issue.update_status(params[:id], st)
#    redirect_to issues_url
  end

end
