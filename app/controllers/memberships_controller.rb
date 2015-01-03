class MembershipsController < ApplicationController
  before_action :set_membership, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :admin_only, only: [:destroy]

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
    session[:return_to] ||= request.referer
  end

  def update
    if @membership.update(update_params)
      flash[:success] = "Membership updated!"
      redirect_to session.delete(:return_to) 
    else
      render 'edit'
    end
  end

  private

    def secure_params
      params.require(:membership).permit(:member_id, :band_id, :role)
    end

    def update_params
      params.require(:membership).permit(:role)
    end

    def set_membership
      @membership = Membership.find(params[:id])
    end
end
