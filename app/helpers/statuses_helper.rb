module StatusesHelper
  def statuses
    #Status.order(id: :desc).all
    Status.order(:id).all
  end

  def status_name(id)
    begin
      Status.find(id).name
    rescue
      ''
    end
  end
  
end
