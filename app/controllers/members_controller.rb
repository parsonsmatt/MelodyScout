class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create, :destroy]

  # GET /artists/:artist_id/members/new
  def new
  end

  # POST /artists/:artist_id/members
  def create
    @membership = Membership.new(member_params)
    if @membership.save
      flash[:success] = "Member added!"
      redirect_to @group
    else
      render 'new'
    end
  end

  # DELETE /artists/:artist_id/members/:id
  def destroy
    @membership = Membership.find_by(member_id: params[:id],
                                     band_id: params[:artist_id])
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to @group, notice: 'Membership was deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = Artist.find(params[:artist_id])
    end

    def member_params
      params.require(:membership).permit(:band_id, :member_id)
    end
end
