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
  
  test "should have the correct instance variables" do
    get :index
    
    assert_equal 'this is a test', assigns(:test_one)
    assert_equal 'test_value', assigns(:test_two)
  end
  
  test "should update the instance variables when given new values via params" do
    get :index, :test_one => 'new_value', :test_two => 'second_new_value'
    
    assert_equal 'new_value', assigns(:test_one)
    assert_equal 'second_new_value', assigns(:test_two)
  end
  
  test "should update the cookies when given new values via params" do
    get :index, :test_one => 'new_value', :test_two => 'second_new_value'
    
    assert_equal 'new_value', cookies['test_one']
    assert_equal 'second_new_value', cookies['test_two']
  end
end