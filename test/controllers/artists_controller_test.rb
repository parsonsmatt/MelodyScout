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

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

end
