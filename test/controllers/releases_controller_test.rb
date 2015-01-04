require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  setup do
    @release = releases(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:releases)
  end

  test "should get new if logged in" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should not get new if not logged in" do
    get :new
    assert_redirected_to login_path
  end

  test "should create release if logged in" do
    log_in_as(@user)
    assert_difference('Release.count') do
      post :create, release: { description: @release.description, name: @release.name }
    end

    assert_redirected_to release_path(assigns(:release))
  end

  test "should not create release if not logged in" do
    assert_no_difference('Release.count') do
      post :create, release: { description: @release.description, name: @release.name }
    end

    assert_redirected_to login_path
  end

  test "should show release" do
    get :show, id: @release
    assert_response :success
  end

  test "should get edit if logged in" do
    log_in_as(@user)
    get :edit, id: @release
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get :edit, id: @release
    assert_redirected_to login_path
  end

  test "should update release if logged in" do
    log_in_as(@user) 
    patch :update, id: @release, release: { description: @release.description, name: @release.name }
    assert_redirected_to release_path(assigns(:release))
  end

  test "should not update release if not logged in" do
    patch :update, id: @release, release: { description: @release.description, name: @release.name }
    assert_redirected_to login_path
  end

  test "should destroy release if admin" do
    log_in_as(users(:admin))
    assert_difference('Release.count', -1) do
      delete :destroy, id: @release
    end
    assert_redirected_to releases_path
  end

  test "should not destroy release if not admin" do
    assert_no_difference('Release.count') do
      delete :destroy, id: @release
    end

    assert_redirected_to root_path
  end
end
