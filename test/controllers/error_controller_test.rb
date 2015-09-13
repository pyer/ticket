require 'test_helper'

class ErrorControllerTest < ActionController::TestCase
  test "should get not_found" do
    get :not_found
    assert_response :not_found
  end

end
