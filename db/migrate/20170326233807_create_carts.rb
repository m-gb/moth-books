class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.decimal :total, precision: 6, scale: 2
      t.decimal :subtotal, precision: 6, scale: 2
      t.decimal :shipping, precision: 4, scale: 2, default: 2.50

      t.timestamps
    end
  end
end
