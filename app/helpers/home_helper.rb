module HomeHelper
  def current_project
    params[:project]
  end

  def all_tickets
    tickets_table = Array.new
    len = 0
    Status.list.each do |s|
      tickets = Issue.select_where_status_is(s.name).to_a
      len = tickets.length if len < tickets.length
      tickets_table.push(tickets)
    end
    tickets_table.each do |t|
       t.concat( Array.new(len-t.length) )
    end
    tickets_table.transpose
  end
end
