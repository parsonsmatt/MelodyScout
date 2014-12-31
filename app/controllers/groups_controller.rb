class GroupsController < ApplicationController
  before_action :set_member, only: [:new,:create]

  # GET artists/:artist_id/groups/new
  def new
    @membership = Membership.new
  end

  # POST artists/:artist_id/groups
  def create
    @membership = Membership.new(member_params)
    if @membership.save
      flash[:success] = "Group added!"
      redirect_to @member
    else
      render 'new' 
    end
  end

  private

    def set_member
      @member = Artist.find_by(id: params[:artist_id])
    end

    def member_params
      params.require(:membership).permit(:band_id, :member_id)
    end
end
