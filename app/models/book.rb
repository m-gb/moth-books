class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :cart_items
end
