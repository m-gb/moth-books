class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category.id)
  end

end
