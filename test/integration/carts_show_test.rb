require 'test_helper'

class CartsShowTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:jack)
    @cart = carts(:three)
    @books = [ books(:lotr), books(:intensity) ]
    cookies[:cart_id] = @cart.id
  end

  test "should show 2 books" do
    sign_in @user
    get cart_path(@cart)
    @books.each do |b|
      assert_select "a[href=?]", book_path(b), text: b.title
      assert_select "a[href=?]", author_path(b.author_id), text: Author.find(b.author_id).name
      assert_select "a[href=?]", category_path(b.category_id), text: Category.find(b.category_id).name
    end
  end
end
