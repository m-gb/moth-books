class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @cart_item = CreateCartItemService.new.call(@cart, cart_item_params)
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update_attributes(cart_item_params)
    @cart_items = @cart.cart_items
    @cart.save
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items
    @cart.save
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id)
  end
end
