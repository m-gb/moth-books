class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @books = Book.joins(:author).where(category_id: @category.id).paginate(page: params[:books_page]).order("authors.name")
    @cart_item = current_cart.cart_items.new
  end

end
