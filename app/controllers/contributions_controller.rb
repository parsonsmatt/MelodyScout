class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]
  before_action :get_form_url, only: [:new]
  before_action :set_artist, only: [:new, :create, :update, :destroy]
  before_action :set_release, only: [:new, :create, :update]
  before_action :set_return, only: [:new, :edit]
  before_action :logged_in_user, only: [
    :new, :create, :edit, :update 
  ]
  before_action :admin_only, only: [:destroy]

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
        flash[:success] = "Contribution was successfully created."
        format.html { 
          redirect_to originating_page
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

  def destroy
    @contribution.destroy
    flash[:success] = "Contribution deleted."
    respond_to do |format|
      format.html { redirect_to originating_page }
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
      params.require(:contribution).permit(:release_id,:artist_id, :role)
    end
    
    def update_params
      params.require(:contribution).permit(:role)
    end

    def set_return
      session[:return_to] ||= request.referer
    end

    # Can come from either Artists or Releases page
    def originating_page
      params[:release_id] ? release_path(set_release) : artist_path(@artist)
    end

    def get_form_url
      @form_url = params[:release_id] ? release_contributions_path(params[:release_id]) 
                                      : artist_contributions_path(params[:artist_id])
    end
end
