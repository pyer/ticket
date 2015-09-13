require 'test_helper'

class StatusesHelperTest < ActionView::TestCase
  test "get status name" do
    assert_equal "",      status_name(0)
    assert_equal "To do", status_name(1)
  end

  test "list of statuses" do
    list = statuses
    assert_equal "To do", statuses.find(1).name
    assert_equal "Done",  statuses.find(2).name
  end

end
