require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example user", 
                     email: "user@example.com",
                     password: "password",
                     password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name length too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email length too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "1"*5
    assert_not @user.valid?
  end

  test "authenticated? should return false for nil digest" do
    assert_not @user.authenticated?('')
  end
end
