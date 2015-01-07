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
    notification = notifications.create(release_date_id: release_date.id)
    artists.each do |artist|
      artist.release! notification
    end
  end
end

class Artist
  def release!(notification)
    followers.each do |follower|
      follower.notify(notification)
    end
  end
end

class User
  has_many :notices
  def notify(notification)
    notices.create(notification_id: notification.id)
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
