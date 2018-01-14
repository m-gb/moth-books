class AuthorsController < ApplicationController

  include Cartable

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id).paginate(page: params[:books_page])
    @cart_item = add_cart_item
  end
end
