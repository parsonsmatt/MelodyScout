class User < ActiveRecord::Base
  attr_accessor :remember_token

  # Callbacks:
  before_save { self.email = email.downcase }
  
  # Validations:
  validates :name, presence: true, 
                   length: { maximum: 50 }
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }  

  # Relations:
  has_many :follows, dependent: :destroy
  has_many :following, through: :follows, source: :artist

  has_secure_password

  def User.digest(password)
    cost = ActiveModel::SecurePassword.min_cost ?  BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
    BCrypt::Password.create(password, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
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

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end
end
