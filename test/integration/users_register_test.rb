require 'test_helper'

class UsersRegisterTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid registration information" do
    get register_path
    assert_no_difference 'User.count' do
      post users_path, user: {  name: "",
                                email: "test@whhyyy",
                                password: "asdf",
                                password_confirmation: "qwer"
                             }
    end
    assert_template 'users/new'
  end

  test "valid registration with activation" do
    get register_path
    assert_difference 'User.count', 1 do 
      post users_path, user: {  name: "test user",
                                email: "newtest@example.com",
                                password: "qwerasdf", 
                                password_confirmation: "qwerasdf"
                             }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?

    # Log in before activation:
    log_in_as(user)
    assert_not is_logged_in?

    # invalid activation token:
    get edit_account_activation_path("invalid token bro")
    assert_not is_logged_in?

    # valid token, wrong email:
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?

    # it's all right
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
