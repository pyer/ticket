class Status < ActiveRecord::Base

  def self.list
    #Status.order(id: :desc).all
    Status.order(:id).all
  end

end
