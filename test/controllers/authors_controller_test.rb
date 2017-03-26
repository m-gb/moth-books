require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @author = authors(:tolkien)
    @books = Book.where(author_id: @author.id)
  end

  test "should get show" do
    get author_path(@author)
    assert_response :success
    @books.each do |b|
      assert_select "a[href=?]", book_path(Book.find(b.id)), count: 2
      assert_select "a[href=?]", author_path(Author.find(b.author_id))
    end
  end
end
