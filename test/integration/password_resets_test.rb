require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:matt)
  end

  test "can get new reset page" do
    get new_password_reset_path
    assert_template 'password_resets/new'
  end

  test "pw reset w invalid email" do
    post password_resets_path, password_reset: { email: "" }
    assert_not flash.empty?
    assert_template 'password_resets/new'
  end

  test "password reset with valid email" do
    post password_resets_path, password_reset: { email: @user.email }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal ActionMailer::Base.deliveries.size, 1
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "password reset form" do
    post password_resets_path, password_reset: { email: @user.email }
    user = assigns(:user)
  end

  #TODO: add more tests
end
