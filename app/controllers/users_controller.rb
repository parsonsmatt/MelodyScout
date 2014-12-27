class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      flash[:success] = "Welcome to TellMe!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
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
end
