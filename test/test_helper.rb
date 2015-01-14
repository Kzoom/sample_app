ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # 14-10-02 ksw...per listing 8.23
  # s/ return true is test user is logged in
  # always returns True to test that's expecting it to be logged out.
  def is_logged_in?
  	!session[:user_id].nil?
  end

  # 14-10-02 ksw...Listing 8.47
  def log_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: {email: user.email,
                                 password:  password,
                                 remember_me: remember_me }
    else
      session[:user_id] = user.id 
    end
  end

  # 14-10-07 ksw...rtns TRUE inside an integration test only
  def integration_test?
    defined?(post_via_redirect)
  end

  # Add more helper methods to be used by all tests here...
end
