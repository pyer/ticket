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
    @description, @status, @project_id = Issue.new.default_values
  end

  def create
    issue = Issue.new
    issue.i_create(params[:description], params[:status], params[:project_id])
    issue.save
    redirect_to issues_url
  end

  def edit
    @current_id = params[:id]
    @sub_title  = "Edit issue ##{@current_id}"
    issue = Issue.find(@current_id.to_i)
    if issue.nil?
      @description, @status, @project_id = Issue.new.default_values
    else
      @description, @status, @project_id = issue.current_values
    end
  end

  def update
    @current_id = params[:id]
    issue = Issue.find(@current_id.to_i)
    if !issue.nil?
      issue.i_update(params[:description], params[:status], params[:project_id])
      issue.save
    end
    redirect_to issues_url
  end

end
