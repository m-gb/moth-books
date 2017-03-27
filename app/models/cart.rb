class Cart < ApplicationRecord
  has_many :cart_items

  before_save :update_subtotal

  def subtotal
    cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
