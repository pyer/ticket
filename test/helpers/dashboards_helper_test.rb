require 'test_helper'

class DashboardsHelperTest < ActionView::TestCase

  test "check blue tag" do
    assert_equal '<img src="/images/pins/blue.png" alt="Blue" />', blue_tag
  end
  test "check green tag" do
    assert_equal '<img src="/images/pins/green.png" alt="Green" />', green_tag
  end
  test "check red tag" do
    assert_equal '<img src="/images/pins/red.png" alt="Red" />', red_tag
  end
  test "check yellow tag" do
    assert_equal '<img src="/images/pins/yellow.png" alt="Yellow" />', yellow_tag
  end

  test "check selected tickets" do
    params[:project]='1'
    s = selected_tickets
    assert_not_nil s
    assert_equal s.class,  Array
#    assert_equal s.length, Status.number
  end

end
