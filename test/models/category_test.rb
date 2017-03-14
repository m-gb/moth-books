require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.create id: 1, name: "Fantasy"
  end

  test "should be valid" do
    assert @category.valid?
  end
end
