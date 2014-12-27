require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.new(name: "test artist")
  end

  test "invalid without name" do
    @artist.name = ""
    assert_not @artist.valid?
  end
end
