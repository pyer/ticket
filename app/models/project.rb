class Project < ActiveRecord::Base
  has_many :issues

  def name_to_id( name )
    self.find_by name: name
  end
end
