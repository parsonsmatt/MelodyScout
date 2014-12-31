class GroupsController < ApplicationController
  before_action :set_member, only: :new

  # GET artists/:artist_id/groups/new
  def new
    @membership = Membership.new
  end

  private

    def set_member
      @member = Artist.find_by(id: params[:artist_id])
    end

end
