require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase

  setup do
    @release = releases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:releases)
  end


  test "should show release" do
    get :show, id: @release
    assert_response :success
  end

end
