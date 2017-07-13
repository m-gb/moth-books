require 'test_helper'

class OrdersIndexTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
    @order = orders(:one)
  end

  test "should show list of orders" do
    sign_in @user
    get orders_path
    assert_select "a[href=?]", order_path(@order), text: "#{@order.id}"
  end

end
