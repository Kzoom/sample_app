require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:michael)
  end

  test "login with invalid information" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, session: { email: "", password: "" }
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get root_path
  	assert flash.empty?
  end

  test "login with valid information followed by logout" do
  	get login_path
  	post login_path, session: { email: @user.email, password: 'password' }
  	assert is_logged_in?
  	assert_redirected_to @user
  	follow_redirect!
  	assert_template 'users/show'
  	assert_select "a[href=?]", login_path, count: 0
  	assert_select "a[href=?]", logout_path
  	assert_select "a[href=?]", user_path(@user)

    # 14-10-02 ksw...listing 8.28 - added to test logout (a couple chgs above too)
  	delete logout_path
  	assert_not is_logged_in?
  	assert_redirected_to root_url

    # (listing 8.40) Simulate a user clicking logout
    #    in a second window this is a dupe call to delete this path
    delete logout_path

  	follow_redirect!
  	assert_select "a[href=?]", login_path
  	assert_select "a[href=?]", logout_path, count: 0
  	assert_select "a[href=?]", user_path(@user), count: 0
  end

  # 14-10-07 ksw...listing 8.48 - test 'remebering' login
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token'] # because cookies won't take symbols, but strings OK
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token'] # because cookies won't take symbols, but strings OK
  end


end
