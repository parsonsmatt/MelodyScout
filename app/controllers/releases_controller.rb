class ReleasesController < ApplicationController
  before_action :logged_in_user, only: [
    :new, :create, :edit, :update
  ]
  before_action :admin_only, only: [:destroy]
  before_action :set_release, only: [
    :show, :edit, :update, :destroy
  ]

  # GET /releases
  # GET /releases.json
  def index
    @releases = Release.all
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
  end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = Release.new(release_params)

    respond_to do |format|
      if @release.save
        flash[:succes] = "Release successfully created!"
        format.html { redirect_to @release, notice: 'Release was successfully created.' }
        format.json { render :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        flash[:success] = "Release successfully updated!"
        format.html { redirect_to @release }
        format.json { render :show, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html { redirect_to releases_url, notice: 'Release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release
      @release = Release.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_params
      params.require(:release).permit(:name, :description,
                    release_dates_attributes: [
                         :date, :region, :id, :_destroy
                    ]
                )
    end
end
