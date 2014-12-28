class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, 
                   length: { maximum: 50 }
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }  

  has_many :follows, dependent: :destroy
  has_many :following, through: :follows, source: :artist

  has_secure_password

  def User.digest(password)
    cost = ActiveModel::SecurePassword.min_cost ?  BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(password, cost: cost)
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
end
