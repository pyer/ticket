class IssuesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def index
    @sub_title = "List of issues"
    @add_item  = '<a href="/issues/new">New issue</a>'
    @issues    = Issue.all
  end
  
  def new
    @sub_title = "New issue"
  end
  
  def create
    logger.debug "--> Creating new issue"
#Create new issue : {"project"=>"aze", "subject"=>"aaaaaaaaaaaaaaaaaaaa", "description"=>"aze description", "author"=>"", "controller"=>"issues", "action"=>"create"}
    issue = Issue.new
    #issue.project = Project.id(params[:project])
    issue.project_id = 1
    issue.subject = params[:subject]
    issue.description = params[:description]
    issue.author  = User.current.name
    issue.status  = 'To do'
    issue.save
    logger.debug "--> Issue #{issue.subject} is created"
    redirect_to issues_url
  end
  
end
