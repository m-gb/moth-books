require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = categories(:fantasy)
  end

  test "should be valid" do
    assert @category.save
  end
end
