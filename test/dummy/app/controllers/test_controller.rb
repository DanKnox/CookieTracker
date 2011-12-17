class TestController < ApplicationController
  before_filter :load_settings_cookies
  
  def index
  end
  
  private
  
  def load_settings_cookies
    initialize_settings_cookies(:test_one => 'this is a test', :hello => 'HELLO!')
  end
  
end