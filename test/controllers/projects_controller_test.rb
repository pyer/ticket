require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get a new project" do
    get :new
    assert_response :success
  end

  test "should create a project" do
    user = User.try_to_login('pba','pba')
    n = Project.count
    post :create, { :name => 'new', :description => 'project' }
    assert_redirected_to projects_url
    assert_equal (n+1), Project.count
  end

  test "should edit a project" do
    get :edit, { :id => '1' }
    assert_response :success
  end

  test "should update a project" do
    user = User.try_to_login('pba','pba')
    post :update, { :id => '1', :name => 'update', :description => 'project' }
    assert_redirected_to projects_url
  end

end
