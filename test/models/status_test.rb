require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "count statuses" do
    assert_equal 2, Status.count
  end

  test "check list of statuses" do
    sts = []
    Status.list.each do |s|
      sts.push s.name
    end
    assert_equal ['To do','Done'], sts
  end
  
end
