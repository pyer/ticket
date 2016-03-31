require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    user = User.try_to_login('pba','pba')
    get :index
    assert_response :success
    User.logoff
  end

  test "get login" do
    get :login
    assert_response :success
  end

  test "post login" do
    post :login
    assert_response :success
  end

  test "get logout" do
    get :logout
    assert_response 302
  end

  test "post logout" do
    post :logout
    assert_response 302
  end

end
