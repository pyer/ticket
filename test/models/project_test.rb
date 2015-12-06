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
    name, desc = Project.default_values
    assert_equal name, ''
    assert_equal desc, ''
  end

  test "check create new project" do
    user = User.try_to_login('pba','pba')
    id = Project.create_new('Name','Description')
    project = Project.find(id)
    assert id > 3
    assert_equal   project.id, id
    assert_equal   project.name, 'Name'
    assert_equal   project.description, 'Description'
    assert_not_nil project.created_on
    assert_equal   project.created_by, 'pba'
    assert_nil     project.updated_by
  end

  test "check update existing project" do
    user = User.try_to_login('pba','pba')
    id = 1
    Project.update_existing(id, 'Name','Description')
    project = Project.find(id)
    assert_equal   project.id, id
    assert_equal   project.name, 'Name'
    assert_equal   project.description, 'Description'
    assert_not_nil project.updated_on
    assert_equal   project.updated_by, 'pba'
  end

  test "check list of projects" do
    prj = []
    Project.list.each do |p|
      prj.push p.name
    end
    assert_equal ["P1", "P2", "P3"], prj
  end
  
end
