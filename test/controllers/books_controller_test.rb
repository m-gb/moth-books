require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get book_path(@book)
    assert_response :success
  end

end
