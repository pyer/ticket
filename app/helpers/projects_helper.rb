module ProjectsHelper

  def project_name(id)
    begin
      Project.find(id).name
    rescue
      ''
    end
  end
  
end
