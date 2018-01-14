class CategoriesController < ApplicationController

  include Cartable

  def show
    @category = Category.find(params[:id])
    @books = ShowCategoryService.new.call(@category, params)
    @cart_item = add_cart_item
  end

end
