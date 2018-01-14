module Cartable
  extend ActiveSupport::Concern

  # Allows adding another book to current cart.
  def add_cart_item
    current_cart.cart_items.new
  end
end
