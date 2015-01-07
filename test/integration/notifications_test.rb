require 'test_helper'

class NotificationsTest < ActionDispatch::IntegrationTest

  def setup
    @release =  Release.create(name: "test")
    @release_date = ReleaseDate.create(release_id: @release.id, date: Date.today, released: false)
    @artist = Artist.create(name: "test artist")
    @artist.contributions.create(release_id: @release.id)
    @user = users(:one)
    @artist.followers.create(id: @user.id)
  end

  test "ReleaseDate#release!" do
    assert_not @release_date.released?
    assert_difference '@release.upcoming.count', -1 do
      assert_difference '@user.notifications.count', 1 do
        @release_date.release!
      end
    end
    assert @release_date.released?
  end
end
