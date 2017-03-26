require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def setup
    @author = authors(:tolkien)
  end

  test "should be valid" do
    assert @author.save
  end
end
