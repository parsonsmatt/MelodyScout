class MembershipsController < ApplicationController
  before_action :get_artist, only: [:index, :new, :create]

  def new
    symbol = @artist.individual? ? :member_id : :band_id;
  end

  def create
    @membership = Membership.new(secure_params)
    @membership.band_id   ||= @artist.id
    @membership.member_id ||= @artist.id

    if @membership.valid? && @membership.save
      redirect_to @artist
    else
      flash[:danger] = @membership.errors
      redirect_to @artist
    end
  end

  private

    def get_artist
      @artist = Artist.find_by(id: params[:artist_id])
    end

    def secure_params
      params.require(:membership).permit(:member_id, :band_id)
    end
end
