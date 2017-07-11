require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def setup
    @author = authors(:tolkien)
  end

  test "should be valid" do
    assert @author.valid?
  end

  test "should require name" do
    @author.name = nil
    assert_not @author.valid?
  end

end
