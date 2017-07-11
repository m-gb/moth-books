require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @order = orders(:one)
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "should require cart" do
    @order.cart_id = nil
    assert_not @order.valid?
  end

  test "should require user" do
    @order.user_id = nil
    assert_not @order.valid?
  end

end
