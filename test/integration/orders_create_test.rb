require 'test_helper'

class OrdersCreateTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:john)
    @cart = carts(:two)
    @book = books(:intensity)
    cookies[:cart_id] = @cart.id
  end

  test "create an order" do
    sign_in @user
    get cart_path(@cart)
    assert_difference 'Order.count', 1 do
      post orders_path, params: { order: { cart: @cart, user: @user },
                                  user: { name: "john",
                                          address: "address",
                                          city: "city",
                                          zip: 1111,
                                          country: "Italy" } }
    end
    assert_redirected_to order_complete_path
  end

end
