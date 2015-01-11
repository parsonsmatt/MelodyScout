class FollowsController < ApplicationController
  before_action :logged_in_user

  def create
    @artist = Artist.find(params[:artist_id])
    @follow = current_user.follows.build
    @follow.artist = @artist
    if @follow.save
      respond_to do |format|
        format.html { redirect_to artist }
        format.js
      end
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @artist = @follow.artist
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to @artist }
      format.js
    end
  end
end
