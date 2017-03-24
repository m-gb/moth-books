class ChangeDescriptionFormatInBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :description, :text, limit: 4294967295
  end
end
