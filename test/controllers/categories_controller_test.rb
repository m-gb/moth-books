require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:fantasy)
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end
end
