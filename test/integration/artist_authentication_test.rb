require 'test_helper'

class ArtistAuthenticationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
    @artist = artists(:one)
  end

  test "should get new if logged in" do
    log_in_as(@user)
    get new_artist_path
    assert_response :success
  end

  test "should not get new if logged in" do
    get new_artist_path
    assert_redirected_to login_path
  end

  test "should create artist if logged in" do
    log_in_as(@user)
    assert_difference('Artist.count') do
      post artists_path, artist: { description: @artist.description, name: @artist.name }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should not create artist if not logged in" do
    assert_no_difference('Artist.count') do
      post artists_path, artist: { description: @artist.description, name: @artist.name }
    end

    assert_redirected_to login_path
  end
  
  test "should get edit if logged in" do
    log_in_as(@user)
    get edit_artist_path @artist
    assert_response :success
  end

  test "should not get edit if not logged in" do
    get edit_artist_path @artist
    assert_redirected_to login_path
  end

  test "should update artist if logged in" do
    log_in_as(@user)
    patch artist_path(@artist), artist: { description: @artist.description, name: @artist.name }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should not update artist if not logged in" do
    patch artist_path(@artist), artist: { description: @artist.description, name: @artist.name }
    assert_redirected_to login_path
  end

  test "should destroy artist if admin" do
    log_in_as(users(:admin))
    assert_difference('Artist.count', -1) do
      delete artist_path @artist
    end

    assert_redirected_to artists_path
  end

  test "should not destroy artist if not admin" do
    delete artist_path @artist
    assert_redirected_to root_path
  end  
end
