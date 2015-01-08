class NoticesController < ApplicationController
  before_action :logged_in_user, :correct_user, only: :destroy
  before_action :set_notice

  def destroy
    
  end
end
