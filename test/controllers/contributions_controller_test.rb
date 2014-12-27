require 'test_helper'

class ContributionsControllerTest < ActionController::TestCase

  test "create contribution" do
    assert Contribution.new(artist_id: 1, release_id: 1)
  end
end
