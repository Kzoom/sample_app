require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  # 14-10-07 ksw...listing 8.52 test for persistent sessions
  test "current_user" do 
  	user = users(:michael)
  	remember(user)
  	assert_equal user, current_user
  end

end
