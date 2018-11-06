require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  test "should get index" do
    user = User.try_to_login('pba','pba')
    get :index
    assert_response :success
#    assert_not_nil assigns(:issues)
    User.logoff
  end

  test "should get a new issue" do
    user = User.try_to_login('pba','pba')
    get :new
    assert_response :success
    User.logoff
  end

  test "should create an issue" do
    user = User.try_to_login('pba','pba')
    n = Issue.count
    post(:create, params: { :description => 'new issue', :status => 'To do', :project_id => '1' })
    assert_redirected_to issues_url
    assert_equal (n+1), Issue.count
    User.logoff
  end

  test "should edit an issue" do
    user = User.try_to_login('pba','pba')
    get(:edit, params: { :id => '1' })
    assert_response :success
    User.logoff
  end

  test "should update an issue" do
    user = User.try_to_login('pba','pba')
    post(:update, params: { :id => '1', :description => 'new issue', :status => 'To do', :project_id => '1' })
    assert_redirected_to issues_url
    User.logoff
  end

  test "should move an issue" do
    user = User.try_to_login('pba','pba')
    post(:move, params: { :id => '1', :status => '2' })
    assert_response :success
    User.logoff
  end
end
