require 'test_helper'

class CleanupRakeTest < ActiveSupport::TestCase
  test "Cart.cleanup should return three fixtures" do
    assert_equal Cart.all.count, 4
    Cart.cleanup
    assert_equal Cart.all.count, 3
  end
end
