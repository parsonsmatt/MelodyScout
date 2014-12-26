require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def setup
    @release = Release.new(name: "Test Release", description: "Lorem Ipsum", date: 1.year.ago)
    @release.artists.new(name: "Stub artist")
  end

  test "should have release date" do
    @release.date = nil
    assert_not @release.valid?
  end
end
