class CartItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :book_present
  validate :cart_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def book_present
    if book.nil?
      errors.add(:book, "is not a valid book.")
    end
  end

  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a valid cart.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
