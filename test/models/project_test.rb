require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "check project fields" do
    project = Project.new
    assert_kind_of Project, project
    assert_empty project.name
    assert_nil   project.description
    assert_nil   project.created_on
    assert_nil   project.created_by
    assert_nil   project.updated_on
    assert_nil   project.updated_by
  end

  test "check default values" do
    project = Project.new
    name, desc = project.default_values
    assert_equal name, ''
    assert_equal desc, ''
  end

  test "check current values" do
    user = User.try_to_login('pba','pba')
    project = Project.new
    project.p_create('Name','Description')
    name, desc = project.current_values
    assert_equal name, 'Name'
    assert_equal desc, 'Description'
  end

  test "check create project" do
    user = User.try_to_login('pba','pba')
    project = Project.new
    project.p_create('Name','Description')
    assert_not_nil project.created_on
    assert_equal   project.created_by, 'pba'
    assert_nil     project.updated_on
    assert_nil     project.updated_by
  end

  test "check update project" do
    user = User.try_to_login('pba','pba')
    project = Project.new
    project.p_update('Name','Description')
    assert_nil     project.created_on
    assert_nil     project.created_by
    assert_not_nil project.updated_on
    assert_equal   project.updated_by, 'pba'
  end

end
