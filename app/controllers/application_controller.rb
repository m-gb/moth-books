class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart # Allows views to call current_cart method.

  def current_cart
    if cookies[:cart_id]
      @cart = Cart.find(cookies[:cart_id])
    elsif session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
  end
end
