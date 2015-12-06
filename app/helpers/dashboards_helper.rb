module DashboardsHelper

  def blue_tag
    image_tag 'pins/blue.png'
  end
  
  def green_tag
    image_tag 'pins/green.png'
  end
  
  def red_tag
    image_tag 'pins/red.png'
  end
  
  def yellow_tag
    image_tag 'pins/yellow.png'
  end
  
  def selected_tickets
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
