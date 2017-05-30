require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "Cart.really_old should return one fixture" do
    assert_equal Cart.all.count, 4
    assert_equal Cart.really_old.count, 1
  end

  test "Cart.without_order should return two fixtures" do
    assert_equal Cart.all.count, 4
    assert_equal Cart.without_order.count, 2
  end
end
