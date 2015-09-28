module ProjectsHelper

  def project_name(id)
    begin
      Project.find(id).name
    rescue
      ''
    end
  end
  
  def project_id(name)
    p = Project.find_by name: name
    return 0 if p.nil?
    return p.id
  end

end
