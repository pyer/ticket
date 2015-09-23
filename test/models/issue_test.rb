require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "check issue fields" do
    issue = Issue.new
    assert_kind_of Issue, issue
    assert_nil   issue.description
    assert_nil   issue.created_on
    assert_nil   issue.created_by
    assert_nil   issue.updated_on
    assert_nil   issue.updated_by
  end

  test "check default values" do
    issue = Issue.new
    desc, status, project_id = issue.default_values
    assert_equal desc, ''
    assert_equal status, 'To do'
    assert_equal project_id, 0
  end

  test "check current values" do
    user = User.try_to_login('pba','pba')
    issue = Issue.new
    issue.i_create('Description', 'Done', 1)
    desc, status, project_id = issue.current_values
    assert_equal desc, 'Description'
    assert_equal status, 'Done'
    assert_equal project_id, 1
  end

  test "check create issue" do
    user = User.try_to_login('pba','pba')
    issue = Issue.new
    issue.i_create('Description', 'Done', 1)
    assert_not_nil issue.created_on
    assert_equal   issue.created_by, 'pba'
    assert_nil     issue.updated_on
    assert_nil     issue.updated_by
  end

  test "check update issue" do
    user = User.try_to_login('pba','pba')
    issue = Issue.new
    issue.i_update('Description', 'Done', 1)
    assert_nil     issue.created_on
    assert_nil     issue.created_by
    assert_not_nil issue.updated_on
    assert_equal   issue.updated_by, 'pba'
  end

end
