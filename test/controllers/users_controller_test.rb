require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    @user2 = users(:two)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit if not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update if not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_equal flash.empty?, false
    assert_redirected_to login_url
  end

  test "should redirect edit if wrong user" do
    log_in_as(@user)
    get :edit, id: @user2
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy if not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy if non-admin" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test "should delete if admin user" do
    log_in_as(users(:matt))
    assert_difference 'User.count', -1 do
      delete :destroy, id: @user
    end
  end
end

