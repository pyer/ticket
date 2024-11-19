require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    # assert_response :success
    assert (@response.response_code == 200 or @response.response_code == 302)
  end

end
