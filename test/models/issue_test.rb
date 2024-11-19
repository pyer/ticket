require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "issue fields" do
    issue = Issue.new
    assert_kind_of Issue, issue
    assert_nil   issue.description
    assert_nil   issue.created_on
    assert_nil   issue.created_by
    assert_nil   issue.updated_on
    assert_nil   issue.updated_by
  end

  test "default values" do
    desc, color, status, project_id = Issue.default_values
    assert_equal '',      desc
    assert_equal 'blue',  color
    assert_equal 'To do', status
    assert_equal 0,       project_id
  end

  test "colors" do
    assert_equal ['blue', 'green', 'red', 'yellow'], Issue.colors
  end

  test "status name" do
    assert_equal "To do",             Issue.status_name(0)
    assert_equal "To do",             Issue.status_name(1)
    assert_equal "Work in progress",  Issue.status_name(2)
    assert_equal "To check out",      Issue.status_name(3)
    assert_equal "Check in progress", Issue.status_name(4)
    assert_equal "Done",              Issue.status_name(5)
    assert_equal "To do",             Issue.status_name(6)
    assert_equal "To do",             Issue.status_name(42)
  end

  test "statuses" do
    assert_equal ['Archive', 'To do', 'Work in progress', 'To check out', 'Check in progress', 'Done'], Issue.all_statuses
    assert_equal [           'To do', 'Work in progress', 'To check out', 'Check in progress', 'Done'], Issue.visible_statuses
  end


  test "check create new issue" do
    user = User.try_to_login('pba','pba')
    id = Issue.create_new('Description', 'red', 'Done', 1)
    issue = Issue.find(id)
    assert id > 1, "new issue id must be 2"
    assert_equal   issue.id, id
    assert_equal   issue.description, 'Description'
    assert_equal   issue.color, 'red'
    assert_equal   issue.status, 'Done'
    assert_equal   issue.project_id, 1
    assert_not_nil issue.created_on
    assert_equal   issue.created_by, 'pba'
    assert_nil     issue.updated_by
  end

  test "check update existing issue" do
    user = User.try_to_login('pba','pba')
    id = 1
    Issue.update_existing(id,'Description', 'red', 'Done', 1)
    issue = Issue.find(id)
    assert_equal   issue.description, 'Description'
    assert_equal   issue.color, 'red'
    assert_equal   issue.status, 'Done'
    assert_equal   issue.project_id, 1
    assert_not_nil issue.updated_on
    assert_equal   issue.updated_by, 'pba'
  end

  test "no issue with unknown status" do
    assert_equal [], Issue.select_where_status_is('_X_')
  end

  test "1 'Done' issue" do
    a = Issue.select_where_status_is('Done')
    assert_equal 1, a.length
  end

  test "2 'To do' issues" do
    a = Issue.select_where_status_is('To do')
    assert_equal 2, a.length
  end
end
