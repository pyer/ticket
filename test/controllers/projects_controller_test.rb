require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    user = User.try_to_login('pba','pba')
    get :index
    assert_response :success
    User.logoff
  end

  test "should get a new project" do
    user = User.try_to_login('pba','pba')
    get :new
    assert_response :success
    User.logoff
  end

  test "should create a project" do
    user = User.try_to_login('pba','pba')
    n = Project.count
    post(:create, params: { name: 'new', description: 'project' })
    assert_response :found
    assert_redirected_to projects_url
    assert_equal (n+1), Project.count
    User.logoff
  end

  test "should edit a project" do
    user = User.try_to_login('pba','pba')
    get( :edit, params: { id: '1' })
    assert_response :success
    User.logoff
  end

  test "should update a project" do
    user = User.try_to_login('pba','pba')
    post(:update, params: { id: '1', name: 'new', description: 'project' })
    assert_response :found
    assert_redirected_to projects_url
    User.logoff
  end

end
