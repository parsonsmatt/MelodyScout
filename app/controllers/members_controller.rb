class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_membership, only: [:edit, :destroy, :update]
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :admin_only, only: [:destroy]

  # GET /artists/:artist_id/members/new
  def new
  end

  # POST /artists/:artist_id/members
  def create
    @membership = Membership.new(member_params)
    @membership.group_id = params[:artist_id]

    if @membership.save
      flash[:success] = "Member added!"
      redirect_to @group
    else
      render 'new'
    end
  end

  # DELETE /artists/:artist_id/members/:id
  def destroy
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

    def set_membership
      @membership = Membership.find_by(member_id: params[:id],
                                       group_id: params[:artist_id])
    end

    def member_params
      params.require(:membership).permit(:member_id, :role)
    end

    def update_params
      params.require(:membership).permit(:role)
    end
end
