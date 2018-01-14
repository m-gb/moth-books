class OrdersController < ApplicationController

  include Cartable

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
    @order = Order.where(user_id: current_user).last
    # Suggests books based on categories of last order's books.
    @books = SuggestionService.new.call(@order)
    @cart_item = add_cart_item
  end

  def index
    @orders = current_user.orders
  end

  def show
    # Returns a cart based on order id from the index page.
    @cart = Cart.find(Order.find(params[:id]).cart_id) 
  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :city, :zip, :country)
    end
end
