class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_only, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Welcome to MelodyScout!"
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(secure_params)
      flash[:success] = "Update successful"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted' }
      format.json { head :no_content }
    end
  end

  private

    def secure_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user? @user
    end

end
