require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @book = books(:lotr)
  end

  test "should be valid" do
    assert @book.save
  end
end
