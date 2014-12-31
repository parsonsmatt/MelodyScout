class GroupsController < ApplicationController
  before_action :set_member, only: [:new,:create,:destroy]

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

  def destroy
    @membership = Membership.find_by(band_id: params[:id],
                                     member_id: params[:artist_id])
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to @member, notice: 'Membership was deleted.' }
      format.json { head :no_content }
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
