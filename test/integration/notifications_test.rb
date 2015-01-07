require 'test_helper'

class NotificationsTest < ActionDispatch::IntegrationTest

  def setup
    @release =  Release.create(name: "test")
    @release_date = ReleaseDate.create(release_id: @release.id, date: Date.today, released: false)
    @artist = Artist.create(name: "test artist")
    @release.contributions.create(artist_id: @artist.id)
    @user = users(:one)
    @user.follows.create(artist_id: @artist.id)
  end

  test "ReleaseDate#release!" do
    assert_not @release_date.released?
    assert_difference '@release.upcoming.count', -1 do
      @release_date.release!
    end
    assert @release_date.released?
  end

  test "User should have notification" do
    assert_not @release_date.released?
    assert_includes @release.artists, @artist
    assert_includes @artist.followers, @user
    assert_difference '@user.notifications.count', 1 do
      @release_date.release!
    end
    assert @release_date.released?
  end

end
