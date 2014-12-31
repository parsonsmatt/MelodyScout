class MembersController < ApplicationController
  before_action :set_group, only: [:new]

  # GET /artists/:artist_id/members/new
  def new
  end

  private

    def set_group
      @group = Artist.find(params[:artist_id])
    end
end
