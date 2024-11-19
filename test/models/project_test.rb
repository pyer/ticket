require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "project fields" do
    project = Project.new
    assert_kind_of Project, project
    assert_empty project.name
    assert_nil   project.description
    assert_nil   project.created_on
    assert_nil   project.created_by
    assert_nil   project.updated_on
    assert_nil   project.updated_by
  end

  test "default values" do
    name, desc = Project.default_values
    assert_equal '', name
    assert_equal '', desc
  end

  test "current values of existing project" do
    user = User.try_to_login('pba','pba')
    assert user.logged?
    id = 1
    name, desc = Project.current_values(id)
    assert_equal 'P1',         name
    assert_equal 'Project #1', desc
  end

  test "current values of unknown project" do
    user = User.try_to_login('pba','pba')
    assert user.logged?
    id = 999
    name, desc = Project.current_values(id)
    assert_equal '', name
    assert_equal '', desc
  end

  test "create new project" do
    user = User.try_to_login('pba','pba')
    assert user.logged?
    id = Project.create_new('Name','Description')
    project = Project.find(id)
    assert id > 3
    assert_equal   id,            project.id
    assert_equal   'Name',        project.name
    assert_equal   'Description', project.description
    assert_equal   'pba',         project.created_by
    assert_not_nil project.created_on
  end

  test "update existing project" do
    user = User.try_to_login('pba','pba')
    assert user.logged?
    id = 1
    Project.update_existing(id, 'Name','Description')
    project = Project.find(id)
    assert_equal   id,            project.id
    assert_equal   'Name',        project.name
    assert_equal   'Description', project.description
    assert_equal   'pba',         project.updated_by
    assert_not_nil project.updated_on
  end

#  test "delete existing project" do
#  end

  test "list of projects" do
    prj = []
    Project.list.each do |p|
      prj.push p.name
    end
    assert_equal ["P1", "P2", "P3"], prj
  end
  
end
