require 'test_helper'

class WallApplicationControllerTest < ActionController::TestCase
  test "should get Signup" do
    get :Signup
    assert_response :success
  end

  test "should get Signin" do
    get :Signin
    assert_response :success
  end

  test "should get ProfileUpdate" do
    get :ProfileUpdate
    assert_response :success
  end

  test "should get Wall" do
    get :Wall
    assert_response :success
  end

end
