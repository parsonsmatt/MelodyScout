class MembershipsController < ApplicationController
  before_action :get_artist, only: [:index]

  # GET /:artist/:artist_id/memerberships
  def index
    @members = @artist.members
    @bands = @artist.bands
  end

  private

    def get_artist
      @artist = Artist.find_by(id: params[:artist_id])
    end
end
