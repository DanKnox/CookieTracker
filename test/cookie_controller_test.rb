require 'test_helper'
class CookieControllerTest < ActionController::TestCase
  
  test "should render index" do
    get :index
    
    assert_response :success
    assert_template :index
  end
  
  test "should have the correct cookies" do
    get :index 
    
    assert_equal 'this is a test', cookies['test_one']
    assert_equal 'test_value', cookies['test_two']
  end
  
  test "initialize_cookie_tracker should set the correct instance variables" do
    get :index
    
    assert_equal 'this is a test', assigns(:test_one)
    assert_equal 'test_value', assigns(:test_two)
  end
  
  test "initialize_cookie_tracker should update the instance variables when given new values via params" do
    get :index, :test_one => 'new_value', :test_two => 'second_new_value'
    
    assert_equal 'new_value', assigns(:test_one)
    assert_equal 'second_new_value', assigns(:test_two)
  end
  
  test "initialize_cookie_tracker should update the cookies when given new values via params" do
    get :index, :test_one => 'new_value', :test_two => 'second_new_value'
    
    assert_equal 'new_value', cookies['test_one']
    assert_equal 'second_new_value', cookies['test_two']
  end
  
  test "initialize_session_tracker should set the correct instance variables" do
    get :index
    
    assert_equal 'test_one', assigns(:session_variable)
    assert_equal 'test_two', assigns(:session_two)
  end
  
  test "initialize_session_tracker should update the instance variables when given new values via params" do
    get :index, :session_variable => 'session_new_value', :session_two => 'session_second_new_value'
    
    assert_equal 'session_new_value', assigns(:session_variable)
    assert_equal 'session_second_new_value', assigns(:session_two)
  end
  
  test "initialize_session_tracker should update the session when given new values via params" do
    get :index, :session_variable => 'session_new_value', :session_two => 'session_second_new_value'
    
    assert_equal 'session_new_value', session['session_variable']
    assert_equal 'session_second_new_value', session['session_two']
  end
end