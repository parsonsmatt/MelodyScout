class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token

  # Callbacks:
  before_save { self.email = email.downcase }
  before_create :create_activation_digest

  # Validations:
  validates :name, presence: true, 
                   length: { maximum: 50 }
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, allow_blank: true  

  # Relations:
  has_many :follows, dependent: :destroy
  has_many :following, through: :follows, source: :artist

  # Notices:
  has_many :notifications, through: :notices
  has_many :notices, dependent: :destroy

  has_secure_password

  def User.digest(password)
    cost = ActiveModel::SecurePassword.min_cost ?  BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
    BCrypt::Password.create(password, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def notify(notification)
    self.notices.create(notification_id: notification.id)
  end

  def follow(artist)
    follows.create(artist_id: artist.id)
  end

  def unfollow(artist)
    follows.find_by(artist_id: artist.id).destroy
  end

  def following?(artist)
    following.include?(artist)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,   User.digest(reset_token))
    update_attribute(:reset_sent_at,  Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
