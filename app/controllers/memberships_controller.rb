class MembershipsController < ApplicationController
  before_action :set_membership, only: [:destroy]

  def index
    @memberships = Membership.all
  end
  
  def create
    @membership = Membership.new(secure_params)

    if @membership.valid? && @membership.save
      redirect_to @membership
    else
      flash[:danger] = @membership.errors
      render 'new'
    end
  end

  def destroy
    store_location
    @membership.destroy

    respond_to do |format|
      format.html { }
      format.json { head :no_content }
    end
  end

  private

    def secure_params
      params.require(:membership).permit(:member_id, :band_id)
    end

    def set_membership
      @membership = Membership.find(params[:id])
    end
end
