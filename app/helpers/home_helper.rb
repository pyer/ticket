module HomeHelper
  def current_project
    params[:project]
  end

  def all_tickets
    tickets_table = Array.new
    len = 0
    visible_status.each do |s|
      tickets = Issue.select_where_status_is(s).to_a
      len = tickets.length if len < tickets.length
      tickets_table.push(tickets)
    end
    tickets_table.each do |t|
       t.concat( Array.new(len-t.length) )
    end
    tickets_table.transpose
  end

  def selected_tickets
    tickets_table = Array.new
    len = 0
    visible_status.each do |s|
      tickets = Issue.select_where_project_and_status_are(current_project,s).to_a
      len = tickets.length if len < tickets.length
      tickets_table.push(tickets)
    end
    tickets_table.each do |t|
       t.concat( Array.new(len-t.length) )
    end
    tickets_table.transpose
  end
end
