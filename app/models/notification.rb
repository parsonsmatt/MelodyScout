class Notification < ActiveRecord::Base
  belongs_to :release
  belongs_to :release_date
  
  has_many :notices
  has_many :users, through: :notices
  
  validates :release_id, presence: true, uniqueness: { scope: :release_date_id }
  validates :release_date_id, presence: true
end
