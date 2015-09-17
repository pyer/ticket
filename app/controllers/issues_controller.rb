class IssuesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @sub_title = "List of issues"
    @add_item  = '<a href="/issues/new">New issue</a>'
    #@issues    = Issue.order(id).all
    @issues    = Issue.all
  end

  def new
    @sub_title = "New issue"
    @action = "/issue/create"
  end

  def create
    logger.debug "--> Creating new issue"
    issue = Issue.new
    #issue.project = Project.id(params[:project])
    issue.project_id = 1
    issue.subject = params[:subject]
    issue.description = params[:description]
    issue.author  = User.current.name
    issue.status  = 'To do'
    issue.save
    redirect_to issues_url
  end

  def edit
    current    = params[:id]
    @sub_title = "Edit issue ##{current}"
    @action    = "/issue/update?id=#{current}"
  end

  def update
    current    = params[:id]
    logger.debug "--> Updating issue #{current}"
    issue = Issue.find(current.to_i)
    issue.subject = params[:subject]
    issue.description = params[:description]
    issue.owner = User.current.name
    issue.save
    redirect_to issues_url
  end

end
