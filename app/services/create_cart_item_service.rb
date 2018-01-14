class CreateCartItemService

  def call(cart, params)
    # Copies the current cart to a new variable, adds a new cart_item to it and saves the changes.
    existing_cart_item = cart.cart_items.find_by(book_id: params[:book_id])
    if existing_cart_item
      cart_item = cart.cart_items.find_by(book_id: params[:book_id]).increment(:quantity)
      cart_item.save
    else
      cart_item = cart.cart_items.new(params)
    end
    cart.save
    cart_item
  end
end
