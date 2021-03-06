class Release < ActiveRecord::Base
  validates :name, presence: true

  has_many :contributions, dependent: :destroy, inverse_of: :release
  has_many :artists, through: :contributions

  has_many :release_dates, dependent: :destroy
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :release_dates, allow_destroy: true
  accepts_nested_attributes_for :contributions, allow_destroy: true

  def add_artist(artist)
    case artist.class.to_s
      when 'Artist'
        contributions.create(artist: artist)
      when 'String'
        contributions.create(artist: Artist.find_by(name: artist))
      else 
        raise ArgumentError.new("Type #{artist.class} unsupported.")
    end
  end

  def has_artists?
    artists.count > 0
  end

  def release!(release_date)
    notification = self.notifications.create(release_date_id: release_date.id)
    artists.each do |artist|
      artist.release!(notification)
    end
  end

  def upcoming
    release_dates.where(released: false)
  end
end
