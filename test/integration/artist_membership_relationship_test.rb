require 'test_helper'

class ArtistMembershipRelationshipTest < ActionDispatch::IntegrationTest
  fixtures :artists

  def setup
    @a1 = artists(:one)
    @a2 = artists(:two)
  end

  test "artist can be member of another" do
    assert @a1.add_member(@a2)
  end

  test "artist can be band of another" do
    assert @a1.add_band(@a2)
  end

  test "can't duplicate relationship" do
    @a1.add_member(@a2)
    assert_raise(ActiveRecord::RecordNotUnique) { @a1.add_member(@a2) }
  end

  test "can't be both member/band at same time" do
    @a1.add_member(@a2)
    @a2.add_member(@a1)
    assert_not @a1.bands.include?(@a2)
  end

  test "can't be member or band of self" do
    assert_not @a1.add_member(@a1).valid?
    assert_not @a1.add_band(@a1).valid?
  end
end
