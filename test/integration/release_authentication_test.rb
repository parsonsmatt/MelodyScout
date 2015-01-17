require 'test_helper'

class ReleaseAuthenticationTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:one)
    @release = releases(:one)
  end

  test "should get new if logged in" do
    log_in_as(@user)
    get new_release_path
    assert_response :success
  end

  test "should not get new if not logged in" do
    get new_release_path
    assert_redirected_to login_path
  end

  test "should create release if logged in" do
    log_in_as(@user)
    assert_difference('Release.count') do
      post releases_path, release: { description: @release.description, name: @release.name }
    end

    assert_redirected_to release_path(assigns(:release))
  end

  test "should not create release if not logged in" do
    assert_no_difference('Release.count') do
      post releases_path, release: { description: @release.description, name: @release.name }
    end

    assert_redirected_to login_path
  end

  test "should get edit if logged in" do
    log_in_as(@user)
    get edit_release_path @release
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_release_path @release
    assert_redirected_to login_path
  end

  test "should update release if logged in" do
    log_in_as(@user) 
    patch release_path(@release), release: { description: @release.description, name: @release.name }
    assert_redirected_to release_path(assigns(:release))
  end

  test "should not update release if not logged in" do
    patch release_path(@release), release: { description: @release.description, name: @release.name }
    assert_redirected_to login_path
  end

  test "should destroy release if admin" do
    log_in_as(users(:admin))
    assert_difference('Release.count', -1) do
      delete release_path @release
    end
    assert_redirected_to releases_path
  end

  test "should not destroy release if not admin" do
    assert_no_difference('Release.count') do
      delete release_path @release
    end
    assert_redirected_to root_path
  end
end
