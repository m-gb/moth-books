class BooksController < ApplicationController

  def index
    @books = if params[:term]
      Book.where('title LIKE :search', search: "%#{params[:term]}%").paginate(page: params[:books_page], per_page: 5)
    else
      Book.paginate(page: params[:page])
    end
    @cart_item = current_cart.cart_items.new
  end

  def show
    @book = Book.find(params[:id])
  end
end
