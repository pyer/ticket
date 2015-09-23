require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get a new issue" do
    get :new
    assert_response :success
  end

  test "should create an issue" do
    user = User.try_to_login('pba','pba')
    n = Issue.count
    post :create, { :description => 'new issue', :status => 'To do', :project_id => '1' }
    assert_redirected_to issues_url
    assert_equal (n+1), Issue.count
  end

  test "should edit an issue" do
    get :edit, { :id => '1' }
    assert_response :success
  end

  test "should update an issue" do
    user = User.try_to_login('pba','pba')
    post :update, { :id => '1', :description => 'new issue', :status => 'To do', :project_id => '1' } 
    assert_redirected_to issues_url
  end

end
