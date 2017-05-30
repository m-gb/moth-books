require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def setup
    @cart = carts(:three)
    @user = users(:jack)
  end

  test "Cart.associated_user should delete the cart_id reference" do
    @cart.associated_user
    assert_nil @user.reload.cart_id
  end

  test "Cart.old should return two fixtures" do
    assert_equal Cart.all.count, 4
    assert_equal Cart.old.count, 2
  end

  test "Cart.without_order should return two fixtures" do
    assert_equal Cart.all.count, 4
    assert_equal Cart.without_order.count, 2
  end

  test "Cart.cleanup should return one fixture" do
    assert_equal Cart.all.count, 4
    assert_equal Cart.cleanup.count, 1
    assert_nil @user.reload.cart_id
  end

end
