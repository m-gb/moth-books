class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    if cookies[:cart_id]
      @cart = Cart.find(cookies[:cart_id])
    elsif session[:cart_id]
      @cart = Cart.find(session[:cart_id])
      if user_signed_in?
        cookies[:cart_id] = {
          value: @cart.id,
          expires: 1.day.from_now
        }
        @cart
      end
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
