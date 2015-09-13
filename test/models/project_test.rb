require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "check name field" do
    assert_empty Project.new.name
  end
end
