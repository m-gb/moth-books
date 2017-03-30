class BooksController < ApplicationController

  def index
    @books = if params[:term]
      Book.where('title LIKE :search', search: "%#{params[:term]}%").paginate(page: params[:books_page], per_page: 8).order("author_id")
    else
      Book.paginate(page: params[:page]).order("author_id")
    end
    @cart_item = current_cart.cart_items.new
  end

  def show
    @book = Book.find(params[:id])
    @cart_item = current_cart.cart_items.new
  end
end
