require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.new(name: "test artist")
  end

  test "invalid without name" do
    @artist.name = ""
    assert_not @artist.valid?
  end

  test "can have members" do
    @artist.add_member(Artist.new(name: "2nd test"))
    assert @artist.members.count == 1
  end
end
