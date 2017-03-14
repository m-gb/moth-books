class AddImageFilenameToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :image_filename, :string
  end
end
