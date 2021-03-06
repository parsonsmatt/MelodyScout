require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
  end

  test "test login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "test login with valid info followed by logout" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password123' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # user logs out again?!?!?
    delete logout_path
    follow_redirect!
  end

  test "test login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "test login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
