require 'test_helper'

class CookieTrackerTest < ActiveSupport::TestCase
  test "initialize_cookie_tracker method should be included in ActionController::Base" do
    assert_includes ApplicationController.instance_methods, :initialize_cookie_tracker
  end
end
