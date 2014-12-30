require 'test_helper'

class ContributionTest < ActiveSupport::TestCase

  def setup
    @contribution = Contribution.new(artist_id: 1, release_id: 1)
  end

  test "must have artist" do
    @contribution.artist_id = nil
    assert_not @contribution.valid?
  end

  test "must have release" do
    @contribution.release_id = nil
    assert_not @contribution.valid?
  end

  test "can't duplicate" do
    cont2 = Contribution.new(artist_id: 1, release_id: 1)
    assert_not cont2.valid?
  end
end
