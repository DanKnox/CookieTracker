class TestControllerTest < ActionController::TestCase
  
  test "should render index" do
    get :index
    
    assert_response :success
    assert_template :index
  end
  
  test "should have the correct cookies" do
    assert_equal 'this is a test', cookies['test_one']
  end
end