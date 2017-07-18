require 'test_helper'

class BestsellersTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:lotr)
  end

  test "should find lotr in carousel items" do
    get root_path
    assert_select "a.item[href=?]", book_path(@book)
  end
end
