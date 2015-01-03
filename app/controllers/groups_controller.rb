class GroupsController < ApplicationController
  before_action :set_member, only: [:new,:create,:destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :admin_only, only: [:destroy]

  # GET artists/:artist_id/groups/new
  def new
    @membership = Membership.new
  end

  # POST artists/:artist_id/groups
  def create
    @membership = Membership.new(group_params)
    @membership.member_id = params[:artist_id]

    if @membership.save
      flash[:success] = "Group added!"
      redirect_to @member
    else
      render 'new' 
    end
  end

  # DELETE artists/:artist_id/groups/:id
  def destroy
    @membership = Membership.find_by(group_id: params[:id],
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

    def group_params
      params.require(:membership).permit(:group_id)
    end
end
