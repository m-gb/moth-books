require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "Cart.unused_cart should return one fixture" do
    assert_equal Cart.all.count, 3
    assert_equal Cart.unused_cart.count, 1
  end
end
