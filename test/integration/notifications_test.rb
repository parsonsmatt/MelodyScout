require 'test_helper'

class NotificationsTest < ActionDispatch::IntegrationTest

  def setup
    @release =  Release.create(name: "test")
    @release_date = ReleaseDate.create(release_id: @release.id, date: Date.today)
    @artist = Artist.create(name: "test artist")
    @artist.contributions.create(release_id: @release.id)
  end

  test "ReleaseDate#release!" do
    @release_date.release!
    assert_equal @release_date.released?, true

  end
end
