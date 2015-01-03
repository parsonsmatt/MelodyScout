require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  setup do
    @artist = artists(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, artist: { description: @artist.description, name: @artist.name }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

  test "should get edit if logged in" do
    log_in_as(@user)
    get :edit, id: @artist
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get :edit, id: @artist
    assert_redirected_to login_path
  end

  test "should update artist if logged in" do
    log_in_as(@user)
    patch :update, id: @artist, artist: { description: @artist.description, name: @artist.name }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should not update artist if not logged in" do
    patch :update, id: @artist, artist: { description: @artist.description, name: @artist.name }
    assert_redirected_to login_path
  end

  test "should destroy artist if admin" do
    log_in_as(users(:admin))
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end

  test "should not destroy artist if not admin" do
    delete :destroy, id: @artist
    assert_redirected_to root_path
  end  
end
