class MembershipsController < ApplicationController
  before_action :get_artist, only: [:index, :new]

  private

    def get_artist
      @artist = Artist.find_by(id: params[:artist_id])
    end
end
