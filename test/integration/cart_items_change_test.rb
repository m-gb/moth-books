require 'test_helper'

class CartItemsChangeTest < ActionDispatch::IntegrationTest

  def setup
    @cart = carts(:one)
    @book = books(:intensity)
    @other_book = books(:lotr)
    cookies[:cart_id] = @cart.id
  end

  test "should add 1 book to cart and remove another" do
    get book_path(@book)
    assert_difference 'CartItem.count', 1 do
      post cart_items_path, params: { cart_item: { book_id: @book.id, quantity: 1 } }
    end
    get cart_path(@cart)
    @cart_item = @cart.cart_items.first
    assert_difference 'CartItem.count', -1 do
      delete cart_item_path(@cart_item)
    end
  end
end
