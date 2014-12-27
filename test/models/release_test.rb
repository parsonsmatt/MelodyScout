require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def setup
    @release = Release.create(name: "Test Release", description: "Lorem Ipsum", date: 1.year.ago)
  end

  test "should have release date" do
    @release.date = nil
    assert_not @release.valid?
  end

  test "can create new artist" do
    old_count = @release.artists.count
    @release.artists.create(name: "test")
    assert_equal old_count+1, @release.artists.count
  end
end
