require 'test_helper'

class CookieTrackerTest < ActiveSupport::TestCase
  test "initialize_cookie_tracker method should be included in ActionController::Base" do
    assert_includes ApplicationController.instance_methods, :initialize_cookie_tracker
  end
  
  test "initialize_session_tracker method should be included in ActionController::Base" do
    assert_includes ApplicationController.instance_methods, :initialize_session_tracker
  end
  
  test "configuration settings in application.rb should be set correctly" do
    assert_equal CookieTracker.configuration[:cookie_expire_date].to_date, 1.year.from_now.to_date
    assert_equal CookieTracker.configuration[:custom_domain], 'localhost'
  end
end
