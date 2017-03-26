require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:lotr)
  end

  test "should get show" do
    get book_path(@book)
    assert_response :success
    assert_select "a[href=?]", author_path(Author.find(@book.author_id))
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

end
