class Users::SessionsController < Devise::SessionsController
  def create
    if user_signed_in?
      # checks if user has a saved cart and saves to cookies.
      if current_user.cart_id
        saved_cart_items = current_user.cart.cart_items
        temp_cart_items = current_cart.cart_items
        # stores all the saved books into an array.
        saved_books = []
        saved_cart_items.each do |saved_item|
          saved_books << saved_item.book_id
        end
        # checks if books in temp_cart are already in saved_cart and adds them if false.
        temp_cart_items.each do |temp_item|
          unless saved_books.include?(temp_item.book_id)
            saved_cart_items << temp_item
          end
        end
        # updates the user's merged cart for future current_cart calls.
        current_user.cart.save
        cookies[:cart_id] = {
          value: current_user.cart_id,
          expires: 1.month.from_now
        }
      else # condition is met when a user's cart was deleted by the cleanup rake task (nil).
        # gets the session's cart_id and saves to cookies.
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
      # saves the current cart to the user table, in case the user deletes their cookies or switches devices.
      current_user.update_attributes(cart_id: cookies[:cart_id])
      cookies.delete :cart_id
    end
    super
  end
end
