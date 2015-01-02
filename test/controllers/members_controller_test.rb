require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  
  def setup
    @m = artists(:individual)
    @g = artists(:group)
    @first = artists(:one)
    @g.add_member(@first)
  end

  test "should get new" do
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

  test "should get edit" do
    get :edit, artist_id: @g.id
  end

end
