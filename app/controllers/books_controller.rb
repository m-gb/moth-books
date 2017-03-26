class BooksController < ApplicationController

  def index
    @books = if params[:term]
      Book.where('title LIKE :search', search: "%#{params[:term]}%")
    else
      Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
