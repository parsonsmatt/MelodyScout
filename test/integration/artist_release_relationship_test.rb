require 'test_helper'

class ArtistReleaseRelationshipTest < ActionDispatch::IntegrationTest
  fixtures :artists, :releases

  def setup 
    @a1 = artists(:one)
    @r1 = releases(:one)
  end

  test "can add a release to artist" do
    count = @a1.releases.count
    assert @a1.add_release(@r1)
    assert_equal count+1, @a1.releases.count
  end

  test "can add an artist to release" do
    count = @r1.artists.count
    assert @r1.add_artist(@a1)
    assert_equal count+1, @r1.artists.count
  end

  test "can check if artist includes release" do
    assert_not @a1.releases.include?(@r1)
  end

  test "can't duplicate relationship" do
    @a1.add_release(@r1)
    assert_no_difference '@a1.releases.count' do
      @a1.add_release(@r1)
    end
  end

  test "can't duplicate from asymmetry" do
    @a1.add_release(@r1)
    assert_no_difference '@a1.releases.count' do
      @r1.add_artist(@a1)
    end
  end
end
