require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  
  def setup
    @m = artists(:individual)
    @g = artists(:group)
    @first = artists(:one)
    @g.add_member(@first)
    log_in_as(users(:one))
  end

  test "should get new logged in" do
    get :new, artist_id: @g.id
    assert_template 'members/new'
  end

  test "create with correct params" do
    post :create, artist_id: @g.id, membership: { member_id: @m.id }
    assert_redirected_to artist_path(@g)
  end

  test "create with invalid params" do
    post :create, artist_id: @g.id, membership: { member_id: nil }
    assert_template 'members/new'
    assert_select 'div', id: 'error_explanation'
  end

end
