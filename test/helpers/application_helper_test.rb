require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Moth Books"
    assert_equal full_title("About"), "About | Moth Books"
  end
end
