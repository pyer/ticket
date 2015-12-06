class Issue < ActiveRecord::Base
#  belongs_to :project

  def self.default_values
    return '', 'To do', 0
  end

  def self.current_values(id)
    issue = Issue.find(id.to_i)
    return  issue.description, issue.status, issue.project_id if !issue.nil?
    return default_values
  end

  def self.create_new(description, status, project_id)
    issue = Issue.new
    issue.description = description
    issue.status      = status
    issue.project_id  = project_id
    issue.created_on  = Time.now
    issue.created_by  = User.current.login
    issue.save
    return issue.id
  end

  def self.update_existing(id, description, status, project_id)
    issue = Issue.find(id.to_i)
    if !issue.nil?
      issue.description = description
      issue.status      = status
      issue.project_id  = project_id
      issue.updated_on  = Time.now
      issue.updated_by  = User.current.login
      issue.save
    end
  end

  @rows = 3

  def self.select_where_status_is(status)
    #issue.find_by(status: "#{status}").order(id:).limit(@rows)
    Issue.where("status = '#{status}'")
  end

  def self.select_where_project_and_status_are(project,status)
    Issue.where("project_id = #{project} and status = '#{status}'")
  end

end
