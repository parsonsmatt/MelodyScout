require 'test_helper'

class NoticesControllerTest < ActionController::TestCase
  test "should not get destroy if not logged in" do
    get :destroy
    assert_redirected_to login_path
  end

end
