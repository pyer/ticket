class Issue < ActiveRecord::Base
#  belongs_to :project

  def default_values
    return '', 'To do', 0
  end

  def current_values
    return self.description, self.status, self.project_id
  end

  def i_create(description, status, project_id)
    self.description = description
    self.status      = status
    self.project_id  = project_id
    self.created_on  = Time.now
    self.created_by  = User.current.login
  end

  def i_update(description, status, project_id)
    self.description = description
    self.status      = status
    self.project_id  = project_id
    self.updated_on  = Time.now
    self.updated_by  = User.current.login
  end

end
