class Release < ActiveRecord::Base
  validates :name, presence: true

  has_many :contributions
  has_many :artists, through: :contributions

  has_many :release_dates

  def add_artist(artist)
    contributions.create(artist_id: artist.try(:id))
  end

  def has_artists?
    artists.count > 0
  end

  def release!(release_date)
    puts "Releasing #{name} in Release"
    artists.each do |artist|
      puts "Sending message to #{artist.name}..."
      artist.release!(self, release_date)
    end
  end
end
