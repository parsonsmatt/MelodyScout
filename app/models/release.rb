class Release < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true

  has_many :contributions
  has_many :artists, through: :contributions
end
