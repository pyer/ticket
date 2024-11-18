require 'test_helper'

class DashboardsHelperTest < ActionView::TestCase

  test "selected tickets" do
    params[:project]='1'
    s = selected_tickets
    assert_not_nil s
    assert_equal s.class,  Array
  end

end
