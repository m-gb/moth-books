class BooksController < ApplicationController

  def index
    @books = if params[:term]
      Book.joins(:author).where("authors.name LIKE :query OR books.title LIKE :query", query: "%#{params[:term]}%").paginate(page: params[:books_page], per_page: 8).order("authors.name")
    else
      Book.joins(:author).paginate(page: params[:books_page]).order("authors.name")
    end
    @cart_item = current_cart.cart_items.new
  end

  def show
    @book = Book.find(params[:id])
    @cart_item = current_cart.cart_items.new
  end
end
