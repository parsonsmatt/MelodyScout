class MembershipsController < ApplicationController
  before_action :set_membership, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    respond_to do |format|
      if @membership.update(secure_params)
        format.html { redirect_to @membership.band, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render 'edit' }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def secure_params
      params.require(:membership).permit(:member_id, :band_id, :role)
    end

    def set_membership
      @membership = Membership.find(params[:id])
    end
end
