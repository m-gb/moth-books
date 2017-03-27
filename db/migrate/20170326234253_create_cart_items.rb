class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.references :book, foreign_key: true
      t.references :cart, foreign_key: true
      t.decimal :unit_price, precision: 6, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
