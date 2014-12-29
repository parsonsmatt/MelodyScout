class Release < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true

  has_many :contributions
  has_many :artists, through: :contributions

  def add_artist(artist)
    contributions.create(artist_id: artist.try(:id))
  end

  def has_artists?
    artists.count > 0
  end
end
