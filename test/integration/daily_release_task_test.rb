require 'test_helper'

class DailyReleaseTaskTest < ActionDispatch::IntegrationTest

  def setup
    @release = Release.create(name: "test release")
    @artist = @release.artists.create(name: "test artist")
    @user = users(:one)
    @user.follow(@artist)
  end

  test "daily_release only hits todays ReleaseDates" do
    for num in -5..5
      @release.release_dates.create(date: num.days.from_now)
    end

    assert_difference '@user.notices.count', 1 do
      ReleaseDate.daily_release
    end
  end
end
