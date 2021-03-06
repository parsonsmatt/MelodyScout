require 'test_helper'

class ContributionsTest < ActionDispatch::IntegrationTest

  def setup
    @artist = artists(:one)
    @release = releases(:one)
    @user = users(:one)
    @admin = users(:admin)
    log_in_as(@user)
  end

  test "artist has new contribution link" do
    get artist_path(@artist)
    assert_template 'artists/show'
    assert_select 'a[href=?]', new_artist_contribution_path(@artist), 1
  end

  test "create new contribution from artist redirect to artist" do
    get new_artist_contribution_path(@artist)
    assert_template 'contributions/new'
    post artist_contributions_path(@artist),
      contribution: { release_id: @release.id, role: "test" }
    assert_redirected_to artist_path(@artist)
    follow_redirect!
    assert_select 'a', text: @release.name
  end

  test "create new cont from release redirect to release" do
    get new_release_contribution_path(@release)
    assert_template 'contributions/new'
    post release_contributions_path(@release),
      contribution: { artist_id: @artist.id, role: "test" }
    assert_redirected_to release_path(@release)
    follow_redirect!
    assert_select 'a', text: @artist.name
  end

  test "edit cont from release redirect to release" do
    cont = new_contribution(@artist, @release)
    get edit_contribution_path(cont), nil,
      { HTTP_REFERER: release_path(@release) }
    assert_template 'contributions/edit'
    patch contribution_path(cont), contribution: { role: "lol wat" }
    assert_redirected_to release_path(@release) 
  end

  test "edit cont from artist redirect to artist" do
    cont = new_contribution(@artist, @release)
    get edit_contribution_path(cont), nil,
      { HTTP_REFERER: artist_path(@artist) }
    patch contribution_path(cont), contribution: { role: "shiggidy" }
    assert_redirected_to artist_path(@artist)
  end

  test "destroy cont from artist as admin" do
    log_in_as(@admin)
    cont = new_contribution(@artist, @release)
    delete artist_contribution_path(@artist, cont)
    assert_not flash.empty?
    assert_redirected_to artist_path(@artist)
  end
 
  test "destroy cont from release as admin" do
    log_in_as(@admin)
    cont = new_contribution(@artist, @release)
    delete release_contribution_path(@release, cont)
    assert_not flash.empty?
    assert_redirected_to release_path(@release)
  end

  test "destroy cont from release as user" do
    cont = new_contribution(@artist, @release)
    delete release_contribution_path(@release, cont)
    assert_not flash.empty?
    assert_redirected_to root_path
  end

 private


    def new_contribution(art, release)
      art.contributions.create(release: release, role: "test")
    end

end
