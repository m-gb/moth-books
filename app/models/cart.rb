class Cart < ApplicationRecord
  has_many :cart_items
  has_one :order

  before_save :update_values

  def shipping
    if subtotal < 20
      2.50
    else
      0
    end
  end

  def subtotal
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
  end

  def total
    shipping + subtotal
  end

private

  def update_values
    self[:shipping] = shipping
    self[:subtotal] = subtotal
    self[:total] = total
  end
end
