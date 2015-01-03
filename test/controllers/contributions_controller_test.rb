require 'test_helper'

class ContributionsControllerTest < ActionController::TestCase

  def setup
    @contribution = contributions(:one)
    @artist = artists(:one)
    @user = users(:one)
  end

end
