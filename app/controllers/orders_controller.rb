class OrdersController < ApplicationController

  def new
    @cart = current_cart
    @user = User.find(current_user.id)
  end

  def complete
    @user = User.find(current_user.id)
    @cart = Cart.find(current_cart.id)
    if @user.update_attributes(user_params)
      Order.create(user_id: @user.id, cart_id: @cart.id)
      session.delete :cart_id
      cookies.delete :cart_id
    else
      render 'new'
    end
  end

  def index

  end

  def show

  end

  private

    def user_params
      params.require(:user).permit(:name, :address, :city, :zip, :country)
    end
end
