class OrdersController < ApplicationController

  def new
    @user = current_user
  end

  def create
    if current_user.update_attributes(user_params)
      Order.create(user_id: current_user.id, cart_id: current_cart.id)
      current_user.update_attribute(:cart_id, session[:cart_id])
      session.delete :cart_id
      cookies.delete :cart_id
      redirect_to '/order_complete'
    else
      render 'new'
    end
  end

  def complete
    @categories = []
    Cart.find(current_user.cart_id).cart_items.each do |cart_item|
      @categories << cart_item.book.category
    end
    @books = []
    @categories.each do |category|
      category.books.each do |book|
        @books << book
      end
    end
    @cart_item = current_cart.cart_items.new
  end

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show

  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :city, :zip, :country)
    end
end
