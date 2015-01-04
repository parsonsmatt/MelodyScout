 require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase

  def setup
    @release = Release.new(name: "Test Release", description: "Lorem Ipsum")
  end


end
