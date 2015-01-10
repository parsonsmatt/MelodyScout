 require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def setup
    @release = Release.create(name: "Test Release", description: "Lorem Ipsum")
  end

  test "should add artist object" do
    artist = Artist.create(name: "test artist")
    assert_difference '@release.artists.count', 1 do
      @release.add_artist(artist)
    end
    assert_includes @release.artists, artist
  end

  test "should add artist string" do
    name = "test artist"
    assert_equal String, name.class
    artist = Artist.create(name: name)
    assert_difference '@release.artists.count', 1 do
      @release.add_artist name
    end
    assert_includes @release.artists, artist
  end

  test "should fail when artist not there" do
    assert_no_difference '@release.artists.count' do
      @release.add_artist "i am not in the db"
    end
  end

  test "should raise argument error if neither artist nor string" do
    assert_raise ArgumentError do
      @release.add_artist 234
    end
  end
end
