module DashboardsHelper

  def blue_tag
    image_tag('pins/blue.png', alt: 'Blue')
  end
 
  def green_tag
    image_tag('pins/green.png', alt:'Green')
  end
 
  def red_tag
    image_tag('pins/red.png', alt:'Red')
  end
 
  def yellow_tag
    image_tag('pins/yellow.png', alt:'Yellow')
  end

  def current_project
    params[:project]
  end

  def selected_tickets
    tickets_table = Array.new
    len = 0
    Status.list.each do |s|
      #tickets = Issue.select_where_status_is(s.name).to_a
      tickets = Issue.select_where_project_and_status_are(current_project,s.name).to_a
      len = tickets.length if len < tickets.length
      tickets_table.push(tickets)
    end
    tickets_table.each do |t|
       t.concat( Array.new(len-t.length) )
    end
    tickets_table.transpose
  end
end
