require 'test_helper'

class IssuesHelperTest < ActionView::TestCase
  test "status name" do
    assert_equal "To do",             status_name(0)
    assert_equal "To do",             status_name(1)
    assert_equal "Work in progress",  status_name(2)
    assert_equal "To check out",      status_name(3)
    assert_equal "Check in progress", status_name(4)
    assert_equal "Done",              status_name(5)
    assert_equal "To do",             status_name(6)
    assert_equal "To do",             status_name(42)
  end

  test "visible status" do
    assert_equal ['To do', 'Work in progress', 'To check out', 'Check in progress', 'Done'], visible_status
  end

end
