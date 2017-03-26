require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:fantasy)
    @books = Book.where(category_id: @category.id)
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
    @books.each do |b|
      assert_select "a[href=?]", book_path(Book.find(b.id)), count: 2
      assert_select "a[href=?]", author_path(Author.find(b.author_id))
    end
  end
end
