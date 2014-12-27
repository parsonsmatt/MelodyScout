class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, 
                   length: { maximum: 50 }
  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }  

  has_many :follows
  has_many :following, through: :follows, source: :artist

  has_secure_password
end
