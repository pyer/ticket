require 'test_helper'

class HomeHelperTest < ActionView::TestCase

  test "selected tickets" do
    params[:project]='1'
    #s = selected_tickets
    s = all_tickets
    assert_not_nil s
    assert_equal s.class,  Array
  end

end
