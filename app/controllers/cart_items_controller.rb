class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    existing_cart_item = @cart.cart_items.find_by(book_id: cart_item_params[:book_id])
    if existing_cart_item
      @cart_item = @cart.cart_items.find_by(book_id: cart_item_params[:book_id]).increment(:quantity)
      @cart_item.save
    else
      @cart_item = @cart.cart_items.new(cart_item_params)
    end
    @cart.save
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id)
  end
end
