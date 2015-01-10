class ReleaseDatesController < ApplicationController
  before_action :set_release, only: [:new, :destroy]

  def new
    @release_date = @release.release_dates.build
  end

  def destroy
  end

  private

    def set_release
      @release = Release.find(params[:release_id])
    end

end
