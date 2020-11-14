require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hello_index_url
    assert_response :success
  end

  test "should get login_check" do
    get hello_login_check_url
    assert_response :success
  end

end
