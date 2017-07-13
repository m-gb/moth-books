require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:jack)
    @order = orders(:two)
  end

  test "should get show" do
    sign_in @user
    get order_path(@order)
    assert_response :success
  end

  test "should get index" do
    sign_in @user
    get orders_path
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_order_path
    assert_response :success
  end

  test "should get complete" do
    sign_in @user
    get order_complete_path
    assert_response :success
  end

end
