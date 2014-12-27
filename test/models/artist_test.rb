require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  def setup
    @artist = Artist.create(name: "test artist")
  end

  test "invalid without name" do
    @artist.name = ""
    assert_not @artist.valid?
  end
  
  test "can add member" do
    member = Artist.create(name: "test member")
    @artist.add_member(member)
    assert_equal @artist.members.count, 1
  end  
end
