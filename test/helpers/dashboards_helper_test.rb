require 'test_helper'

class DashboardsHelperTest < ActionView::TestCase

  test "check blue tag" do
    assert_equal '<img alt="Blue" src="/images/pins/blue.png" />', blue_tag
  end
  test "check green tag" do
    assert_equal '<img alt="Green" src="/images/pins/green.png" />', green_tag
  end
  test "check red tag" do
    assert_equal '<img alt="Red" src="/images/pins/red.png" />', red_tag
  end
  test "check yellow tag" do
    assert_equal '<img alt="Yellow" src="/images/pins/yellow.png" />', yellow_tag
  end

  test "check selected tickets" do
    params[:project]='1'
    s = selected_tickets
    assert_not_nil s
    assert_equal s.class,  Array
#    assert_equal s.length, Status.number
  end

end
