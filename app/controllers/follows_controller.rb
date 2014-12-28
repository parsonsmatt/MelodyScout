class FollowsController < ApplicationController
  before_action :logged_in_user

  def create
    artist = Artist.find(params[:artist_id])
    current_user.follow(artist)
    respond_to do |format|
      format.html { redirect_to artist }
      format.js
    end
  end

  def destroy
    artist = Follow.find(params[:id]).artist
    current_user.unfollow(artist)
    respond_to do |format|
      format.html { redirect_to artist }
      format.js
    end
  end
end
