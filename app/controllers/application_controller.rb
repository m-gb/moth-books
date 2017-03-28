class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
      if session[:cart_id].nil?
        cart = Cart.create
        session[:cart_id] = cart.id
        return cart
      else
        Cart.find(session[:cart_id])
      end
    end
end
