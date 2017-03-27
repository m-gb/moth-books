class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
      if !session[:cart_id].nil?
        Cart.find(session[:cart_id])
      else
        Cart.new
      end
    end
end
