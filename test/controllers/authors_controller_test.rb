require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @author = authors(:tolkien)
  end

  test "should get show" do
    get author_path(@author)
    assert_response :success
  end
end
