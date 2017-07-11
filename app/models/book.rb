class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :cart_items
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { maximum: 4294967295 }
end
