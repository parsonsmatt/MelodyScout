class MembershipsController < ApplicationController

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

  private

    def secure_params
      params.require(:membership).permit(:member_id, :band_id)
    end
end
