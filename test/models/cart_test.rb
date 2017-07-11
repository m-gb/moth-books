require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def setup
    @cart = carts(:three)
    @user = users(:jack)
  end

  test "should be valid" do
    assert @cart.valid?
  end

  test "shipping should be 0" do # subtotal is higher than 20
    assert_equal @cart.shipping, 0
  end

  test "subtotal should be correct" do # subtotal is cart_item one and four
    assert_equal @cart.subtotal, 42.87
  end

  test "total should be correct" do
    assert_equal @cart.total, 42.87
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
