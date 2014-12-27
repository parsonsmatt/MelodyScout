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
end
