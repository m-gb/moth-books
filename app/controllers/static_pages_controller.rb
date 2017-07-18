class StaticPagesController < ApplicationController
  def home
    # Returns 5 bestsellers by count in the database.
    bestsellers_hash = CartItem.joins(cart: :order).select(:book_id).group(:book_id).order('count_book_id desc').limit(5).count
    @books = []
    bestsellers_hash.each do |key,value|
      @books << Book.find(key) # Uses the book_id in the hash and finds the corresponding book.
    end
    # Returns last 6 books added to the db.
    @arrivals = Book.order(created_at: :desc).limit(6)
    @cart_item = current_cart.cart_items.new # Allows adding new arrivals to current cart.
  end

  def help
  end

  def about
  end

  def contact
  end
end
