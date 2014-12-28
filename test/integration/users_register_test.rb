require 'test_helper'

class UsersRegisterTest < ActionDispatch::IntegrationTest

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

  test "registration sends to user page" do
    get register_path
    post users_path, user: {  name: "test user", email: "test@example.com",
                              password: "qwerasdf", password_confirmation: "qwerasdf" }
    assert_template 'users/show'
  end

end
