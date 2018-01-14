class StaticPagesController < ApplicationController
  def home
    # Returns 5 bestsellers by ordered book count in the database.
    @books = BestsellerService.new.call(5)
    # Returns last 6 books added to the database.
    @arrivals = ArrivalService.new.call(6)
    # Allows adding new arrivals to current cart.
    @cart_item = current_cart.cart_items.new
  end

  def help
  end

  def about
  end

  def contact
  end
end
