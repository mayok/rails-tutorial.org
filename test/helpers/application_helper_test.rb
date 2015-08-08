require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,    "Rails tutorial"
    assert_equal full_title("Help"), "Help | Rails tutorial"
  end
end
