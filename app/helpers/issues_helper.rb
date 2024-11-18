module IssuesHelper

  STATUS = ['Archive', 'To do', 'Work in progress', 'To check out', 'Check in progress', 'Done']


  def status_name_where_id_is(i)
    i = 1 if i<1 or i>5
    STATUS[i]
  end

  def visible_status
    STATUS[1..5]
  end

end
