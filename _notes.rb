# ReleaseDate starts cascading:
class ReleaseDate
  def release!
    release.release!(self)
    released = true
    save
  end
end

# Release receives the notification
class Release
  def release!(release_date)
    artists.each do |artist|
      artist.release!(notifications.build(release_date_id: release_date.id))
    end
  end
end

class Artist
  def release!(release, release_date)
    followers.each do |follower|
      follower.notify(release, release_date)
    end
  end
end

class User
  has_many :notices
  def notify(release, release_date)
    notifications.create(release, release_date)
  end
end

class Notification
  belongs_to :release
  belongs_to :release_date
  
  validates :release_id, presence: true
  validates :release_date_id, presence: true

  has_many :notices
  has_many :users, through: :notices
end

class Notice
  # notification_id =>
  # user_id
  validates :notification_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, uniqueness: { scope: :user_id }
end
