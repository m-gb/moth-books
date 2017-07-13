require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @cart = carts(:one)
  end

  test "should get show" do
    get cart_path(@cart)
    assert_response :success
  end

end
