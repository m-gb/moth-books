class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :order
  has_one :user

  before_save :update_values

  def shipping
    if subtotal < 20
      2.50
    else
      0
    end
  end

  def subtotal # calculates a subtotal of all valid cart_items belonging to the cart.
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
  end

  def total
    shipping + subtotal
  end

  # deletes the cart_id reference in the user table if there is any.
  def associated_user
    user = User.find_by(cart_id: self.id) # returns the user_id associated with a cart to delete it.
    if user
      user.update_attribute(:cart_id, nil)
    end
  end

  # returns all carts older than a week.
  def self.old
    where(updated_at: 1.year.ago..1.week.ago)
  end

  # returns all carts which don't have an associated order.
  def self.without_order
    left_outer_joins(:order).where( orders: { id: nil } )
  end

  def self.cleanup
    carts = old.without_order
    carts.each do |cart|
      cart.associated_user
    end
    carts.destroy_all
  end
private

  def update_values
    self[:shipping] = shipping
    self[:subtotal] = subtotal
    self[:total] = total
  end
end
