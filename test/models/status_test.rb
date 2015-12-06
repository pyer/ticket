require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "count statuses" do
    assert_equal 2, Status.number
  end
end
