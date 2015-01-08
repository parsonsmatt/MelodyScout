require 'test_helper'

class NoticeDismissalTestTest < ActionDispatch::IntegrationTest

  def setup
    @release = Release.create(name: "hello")
    @release_date = @release.release_dates.create(date: 1.day.ago)
    @artist = Artist.create(name: "test artist")
    @release.contributions.create(artist_id: @artist.id)
    @user = users(:one)
    @user.follow(@artist)
    @release_date.release!
  end

  test "relations should be right" do
    assert_includes @release.release_dates, @release_date
    assert_includes @release.artists, @artist
    assert_includes @artist.followers, @user
  end

end
