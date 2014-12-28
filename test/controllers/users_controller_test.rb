require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should list users" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not get edit if not logged in" do
    put :edit, id: users(:one)
    assert_response :redirect
  end
end

