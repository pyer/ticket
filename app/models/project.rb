class Project < ActiveRecord::Base
  has_many :issues

  def self.default_values
    return '', ''
  end

  def self.current_values(id)
    begin
      project = Project.find(id.to_i)
      return project.name, project.description
    rescue
      return default_values
    end
  end

  def self.create_new(name,description)
    project = Project.new
    project.name        = name
    project.description = description
    project.created_on  = Time.now
    project.created_by  = User.current.login
    project.save
    return project.id
  end

  def self.update_existing(id, name, description)
    project = Project.find(id.to_i)
    if !project.nil?
      project.name        = name
      project.description = description
      project.updated_on  = Time.now
      project.updated_by  = User.current.login
      project.save
    end
  end

  def self.delete_existing(id)
    Project.delete(id.to_i)
  end

  def self.list
    Project.order(:name).all
  end
end
