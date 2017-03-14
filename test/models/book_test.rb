require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @category = Category.create id: 1, name: "Fantasy"
    @book = Book.create id: 1, title: "The Lord of the Rings", author: "J.R.R. Tolkien", category_id: @category.id, year: 1954
  end

  test "should be valid" do
    assert @book.valid?
  end
end
