class Users::SessionsController < Devise::SessionsController
  def create
    if user_signed_in?
      if current_user.cart_id
        cookies[:cart_id] = {
          value: current_user.cart_id,
          expires: 1.month.from_now
        }
      else
        cookies[:cart_id] = {
          value: session[:cart_id],
          expires: 1.month.from_now
        }
      end
    end
    super
  end
  def destroy
    if user_signed_in?
      current_user.update_attributes(cart_id: cookies[:cart_id])
      cookies.delete :cart_id
    end
    super
  end
end
