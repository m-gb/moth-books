class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name,     :string
    add_column :users, :address,  :string
    add_column :users, :city,     :string
    add_column :users, :zip,      :integer
    add_column :users, :country,  :string
  end
end
