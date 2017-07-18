require 'test_helper'

class NewArrivalsTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:intensity)
  end

  test "should find intensity link" do
    get root_path
    assert_select "a[href=?]", book_path(@book)
  end
end
