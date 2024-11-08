require 'test_helper'

class DashboardsHelperTest < ActionView::TestCase

  test "check selected tickets" do
    params[:project]='1'
    s = selected_tickets
    assert_not_nil s
    assert_equal s.class,  Array
#    assert_equal s.length, Status.number
  end

end
