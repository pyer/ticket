class Project < ActiveRecord::Base
  has_many :issues

  def default_values
    return '', ''
  end

  def current_values
    return self.name, self.description
  end

  def p_create(name,description)
    self.name        = name
    self.description = description
    self.created_on  = Time.now
    self.created_by  = User.current.login
  end

  def p_update(name, description)
    self.name        = name
    self.description = description
    self.updated_on  = Time.now
    self.updated_by  = User.current.login
  end

end
