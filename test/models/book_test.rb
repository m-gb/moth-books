require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = books(:lotr)
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "should not be valid without title" do
    @book.title = nil
    assert_not @book.valid?
  end

  test "should not be valid without price" do
    @book.price = nil
    assert_not @book.valid?
  end

  test "should not be valid with negative price" do
    @book.price = -1
    assert_not @book.valid?
  end

  test "should not be valid without year" do
    @book.year = nil
    assert_not @book.valid?
  end

  test "should not be valid with negative year" do
    @book.year = -1
    assert_not @book.valid?
  end

  test "should not be valid with decimal year" do
    @book.year = 1.5
    assert_not @book.valid?
  end

  test "should not be valid without description" do
    @book.description = nil
    assert_not @book.valid?
  end

  test "should require an author" do
    @book.author_id = nil
    assert_not @book.valid?
  end

  test "should require a category" do
    @book.category_id = nil
    assert_not @book.valid?
  end
end
