require 'test_helper'

class GroupMembersArtistsTest < ActionDispatch::IntegrationTest
  
  def setup
    @g = artists(:group)
    @m = artists(:individual)
    @user = users(:one)
  end

  test "group page has members section" do
    get artist_path(@g)
    assert_template 'artists/_members'
  end

  test "member page has groups section" do
    get artist_path(@m)
    assert_template 'artists/_groups'
  end

  test "add member to group logged in" do
    log_in_as(@user)
    post artist_members_path(@g), membership: { member_id: @m.id }
    assert_not flash.empty?
    assert_redirected_to @g
    follow_redirect!
    assert_select 'a', text: @m.name
    get artist_path(@m)
    assert_select 'a', text: @g.name
  end

  test "add member to group not logged in" do
    post artist_members_path(@g), membership: { member_id: @m.id }
    assert_redirected_to login_path
  end

  test "add group to member logged in" do
    log_in_as(@user)
    post artist_groups_path(@m), membership: { band_id: @g.id }
    assert_not flash.empty?
    assert_redirected_to @m
    follow_redirect!
    assert_select 'a', text: @g.name
    get artist_path(@g)
    assert_select 'a', text: @m.name
  end

  test "add group to member not logged in" do
    post artist_groups_path(@m), membership: { band_id: @g.id }
    assert_redirected_to login_path
  end

  test "delete group from member as admin" do
    log_in_as(users(:admin))
    @g.add_member(@m)
    delete artist_member_path(@g,@m)
    assert_not flash.empty?
    assert_not @g.members.include?(@m)
  end

  test "delete group from member without admin" do
    @g.add_member(@m)
    delete artist_member_path(@g,@m)
    assert_redirected_to root_path
  end

  test "delete member from group as admin" do
    log_in_as(users(:admin))
    @g.add_member(@m)
    delete artist_group_path(@m, @g)
    assert_not flash.empty?
    assert_not @g.members.include?(@m)
  end

  test "delete member from group not as admin" do
    @g.add_member(@m)
    delete artist_group_path(@m, @g)
    assert_redirected_to root_path
  end

  test "edit member from group redirects to group" do
    @g.add_member(@m)
    get artist_path(@g)
    assert_select 'a', text: @m.name
    membership = Membership.find_by(band_id: @g.id, member_id: @m.id)
    assert_select 'a[href=?]', edit_membership_path(membership)
    get edit_membership_path(membership), nil, 
        { HTTP_REFERER: artist_path(@g) }
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to edit_membership_path(membership)
    follow_redirect!
    assert_template 'memberships/edit'
    get edit_membership_path(membership), nil, 
        { HTTP_REFERER: artist_path(@g) }
    patch membership_path(membership), membership: { role: "test" }
    assert_redirected_to artist_path(@g)
  end

  test "edit membership from member redirects to member" do
    @m.add_group(@g)
    get artist_path(@m)
    assert_select 'a', text: @g.name
    membership = Membership.find_by(band_id: @g.id, member_id: @m.id)
    get edit_membership_path(membership), nil,
      { HTTP_REFERER: artist_path(@m) }
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to edit_membership_path(membership)
    follow_redirect!
    assert_template 'memberships/edit'
    get edit_membership_path(membership), nil, 
        { HTTP_REFERER: artist_path(@m) }
    patch membership_path(membership), membership: { role: "test" }
    assert_redirected_to artist_path(@m)
  end
end
