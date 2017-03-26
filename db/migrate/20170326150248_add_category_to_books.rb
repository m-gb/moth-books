class AddCategoryToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :category, foreign_key: true
  end
end
