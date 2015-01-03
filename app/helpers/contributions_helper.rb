module ContributionsHelper
  
  def get_right_url
      params[:release_id] ? release_contributions_path(@release) : artist_contributions_path(@artist)
  end

end
