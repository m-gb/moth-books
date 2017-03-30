class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id).paginate(page: params[:books_page]).order("author_id")
    @cart_item = current_cart.cart_items.new
  end
end
