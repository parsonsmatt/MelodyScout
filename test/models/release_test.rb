require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def setup
    @release = Release.create(name: "Test Release", description: "Lorem Ipsum", date: 1.year.ago)
  end

  test "should have release date" do
    @release.date = nil
    assert_not @release.valid?
  end

  test "can add artist" do
    artist = Artist.create(name: "test")
    @release.add_artist(artist)
    assert @release.artists.include?(artist)
  end
end
