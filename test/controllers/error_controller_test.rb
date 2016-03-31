require 'test_helper'

class ErrorControllerTest < ActionController::TestCase
  test "should get not_found" do
    user = User.try_to_login('pba','pba')
    get :not_found
    assert_response :not_found
    User.logoff
  end

end
