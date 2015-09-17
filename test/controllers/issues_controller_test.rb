require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
#    assert_not_nil @issues
  end

end
