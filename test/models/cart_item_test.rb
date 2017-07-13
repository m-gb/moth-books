require 'test_helper'

class CartItemsTest < ActiveSupport::TestCase

  def setup
    @cart_item = cart_items(:one)
  end

  test "should be valid" do
    assert @cart_item.valid?
  end

  test "should not be valid without quantity" do
    @cart_item.quantity = nil
    assert_not @cart_item.valid?
  end

  test "should not be valid with negative quantity" do
    @cart_item.quantity = -1
    assert_not @cart_item.valid?
  end

  test "should not be valid with decimal quantity" do
    @cart_item.quantity = 1.5
    assert_not @cart_item.valid?
  end

  test "should not be valid without book" do
    @cart_item.book_id = nil
    assert_not @cart_item.valid?
  end

  test "should not be valid without cart" do
    @cart_item.cart_id = nil
    assert_not @cart_item.valid?
  end

  test "unit_price should be equal to book price" do
    assert_equal @cart_item.book.price, @cart_item.unit_price
  end

  test "total_price should be equal to " do
    total = @cart_item.unit_price * @cart_item.quantity
    assert_equal @cart_item.total_price, total
  end
end
