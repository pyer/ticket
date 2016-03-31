class Status < ActiveRecord::Base

  def self.list
    #Status.order(id: :desc).all
    Status.order(:id).all
  end

  def self.name_where_id_is(id)
    Status.find(id.to_i).name
  end

end
