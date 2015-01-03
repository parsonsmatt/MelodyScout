require 'test_helper'

class ArtistMembershipRelationshipTest < ActionDispatch::IntegrationTest
  fixtures :artists

  def setup
    @a1 = artists(:one)
    @a2 = artists(:two)
  end

  test "artist can be member of another" do
    assert_difference '@a1.members.count', 1 do
      @a1.add_member(@a2)
    end
  end

  test "artist can be group of another" do
    assert_difference '@a1.groups.count', 1 do
      @a1.add_group(@a2)
    end
  end

  test "can't duplicate relationship" do
    @a1.add_member(@a2)
    assert_no_difference '@a1.members.count' do
      @a1.add_member(@a2)
    end
  end

  test "can't be both member/group at same time" do
    @a1.add_member(@a2)
    assert @a1.members.include?(@a2)
    @a2.add_member(@a1)
    assert_not @a1.groups.include?(@a2)
  end

  test "can't be member or group of self" do
    assert_no_difference 'Membership.all.count' do
      @a1.add_member(@a1)
    end
    assert_no_difference 'Membership.all.count' do
      @a1.add_group(@a1)
    end
  end
end
