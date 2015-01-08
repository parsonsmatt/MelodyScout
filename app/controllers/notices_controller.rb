class NoticesController < ApplicationController
  before_action :logged_in_user, :correct_user, only: :destroy
  before_action :set_notice

  def destroy
    @notice.destroy
    flash[:success] = "Dismissed"
  end

  private
    
    def set_notice
      @notice = Notice.find_by(id: params[:id])
    end
end
