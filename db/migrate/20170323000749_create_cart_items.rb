class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.belongs_to :books, index: true
      t.belongs_to :carts, index: true

      t.timestamps
    end
  end
end
