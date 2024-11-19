require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    User.try_to_login('pba','pba')
    get :index
    assert_response :success
    #assert (@response.response_code == 200 or @response.response_code == 302)
    User.logoff
  end

  test "should get redirect" do
    User.logoff
    get :index
    assert_response :redirect
  end

end
