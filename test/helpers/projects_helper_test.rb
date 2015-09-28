require 'test_helper'

class ProjectsHelperTest < ActionView::TestCase
  test "get project name" do
    assert_equal "",   project_name(0)
    assert_equal "P1", project_name(1)
  end

  test "get project id" do
    assert_equal 0, project_id('undefined')
    assert_equal 1, project_id('P1')
  end

end
