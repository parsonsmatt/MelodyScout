class MembershipsController < ApplicationController
  before_action :get_artist, only: [:index, :new]

  def new
    symbol = @artist.individual? ? :member_id : :band_id;
    @membership = Membership.new( symbol => @artist.id)
  end

  private

    def get_artist
      @artist = Artist.find_by(id: params[:artist_id])
    end
end
