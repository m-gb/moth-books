class BooksController < ApplicationController

  include Cartable

  def index
    @books = IndexBooksService.new.call(params)
    @cart_item = add_cart_item
  end

  def show
    @book = Book.find(params[:id])
    @cart_item = add_cart_item
  end
end
