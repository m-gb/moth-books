class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @books = Book.where(category_id: @category.id).paginate(page: params[:books_page])
    @cart_item = current_cart.cart_items.new
  end

end
