require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.create(name: "test artist")
  end

  test "invalid without name" do
    @artist.name = ""
    assert_not @artist.valid?
  end

  test "member access" do
    @artist.members.create
  end
  
  test "can add member" do
    member = Artist.create(name: "test member")
    @artist.add_member(member)
    assert_equal @artist.members.count, 1
  end

  test "can add band" do
    band = Artist.create(name: "some band")
    @artist.add_band(band)
    assert_equal @artist.bands.count, 1
  end

  test "can add release" do
    release = Release.create(name: "whateever", date: 1.year.ago)
    @artist.add_release(release)
    assert @artist.releases.include?(release)
  end

  test "nil band add doesn't screw it all up" do
    @artist.add_band(nil)
    assert_equal @artist.bands.count, 0
  end  
end
