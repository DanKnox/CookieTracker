class CookieController < ApplicationController
  before_filter :load_settings_cookies
   
  def index
  end
  
  private
  
  def load_settings_cookies
    initialize_cookie_tracker(:test_one => 'this is a test', :test_two => 'test_value', :hello => 'HELLO!')
    initialize_session_tracker(:session_variable => 'test_one', :session_two => 'test_two', :hello_session => 'HELLO!')
  end
  
end