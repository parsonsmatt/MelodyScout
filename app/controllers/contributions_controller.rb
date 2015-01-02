class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]
  before_action :set_artist, only: [:new, :create, :update]
  before_action :set_release, only: [:new, :create, :update]
  before_action :set_return, only: [:new, :edit]

  # GET /artists/:artist_id/contributions
  # GET /releases/:release_id/contributions
  def index
    @contributions = Contribution.all
  end

  # GET /contributions/1
  def show
  end

  # GET /artists/:artist_id/contributions/new
  # GET /releases/:release_id/contributions/new
  def new
    @contribution = Contribution.new
  end

  # POST /artists/:artist_id/contributions
  # POST /releases/:release_id/contributions
  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.release_id ||= params[:release_id]
    @contribution.artist_id  ||= params[:artist_id]

    respond_to do |format|
      if @contribution.save
        format.html { 
          redirect_to originating_page,
          notice: 'Contribution was successfully created.' 
        }
        format.json {
          render :show, 
          status: :created, 
          location: @contribution
        }
      else
        format.html { render :new }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @contribution.update(update_params)
      flash[:success] = "Contribution successfuly updated!"
      redirect_to session.delete(:return_to)
    else
      render 'edit'
    end
  end

  private
  
    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    def set_artist
      @artist = Artist.find_by(id: params[:artist_id])
    end

    def set_release
      @release = Release.find_by(id: params[:release_id])
    end

    def contribution_params
      params.require(:contribution).permit(:release_id,:artist_id)
    end
    
    def update_params
      params.require(:contribution).permit(:role)
    end

    def set_return
      session[:return_to] ||= request.referer
    end

    def originating_page
      params[:release_id] ? release_path(@release) : artist_path(@artist)
    end

end
