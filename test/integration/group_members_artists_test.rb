require 'test_helper'

class GroupMembersArtistsTest < ActionDispatch::IntegrationTest
  
  def setup
    @g = artists(:group)
    @m = artists(:individual)
  end

  test "group page has members section" do
    get artist_path(@g)
    assert_template 'artists/_members'
  end

  test "member page has groups section" do
    get artist_path(@m)
    assert_template 'artists/_groups'
  end

  test "add member to group" do
    post artist_members_path(@g), membership: { member_id: @m.id }
    assert_not flash.empty?
    assert_redirected_to @g
    follow_redirect!
    assert_select 'a', text: @m.name
    get artist_path(@m)
    assert_select 'a', text: @g.name
  end

  test "add group to member" do
    post artist_groups_path(@m), membership: { band_id: @g.id }
    assert_not flash.empty?
    assert_redirected_to @m
    follow_redirect!
    assert_select 'a', text: @g.name
    get artist_path(@g)
    assert_select 'a', text: @m.name
  end

  test "delete group from member" do
    @g.add_member(@m)
    delete artist_member_path(@g,@m)
    assert_not flash.empty?
    assert_not @g.members.include?(@m)
  end

  test "delete member from group" do
    @g.add_member(@m)
    delete artist_group_path(@m, @g)
    assert_not flash.empty?
    assert_not @g.members.include?(@m)
  end

  test "edit member from group redirects to group" do
    @g.add_member(@m)
    get artist_path(@g)
    assert_select 'a', text: @m.name
    membership = Membership.find_by(band_id: @g.id, member_id: @m.id)
    assert_select 'a[href=?]', edit_membership_path(membership)
    get edit_membership_path(membership), nil, 
        { HTTP_REFERER: artist_path(@g) }
    assert_template 'memberships/edit'
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
    assert_template 'memberships/edit'
    patch membership_path(membership), membership: { role: "test" }
    assert_redirected_to artist_path(@m)
  end
end
