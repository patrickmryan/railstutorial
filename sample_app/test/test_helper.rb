ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Log in as a particular user.
  def log_in_as(user, options = {})
    password    = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
     #debugger
    if (integration_test?)
      self.post(self.login_path(), session: { email: user.email,
        password: password,
        remember_me: remember_me })
    else
      self.session()[:user_id] = user.id
    end

  end
  
  private
  def integration_test?
    # return true inside an integration test
    defined?(post_via_redirect)
  end

end