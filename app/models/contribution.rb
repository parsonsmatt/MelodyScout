class Contribution < ActiveRecord::Base
  belongs_to :artist
  belongs_to :release

  validates :artist_id, presence: true
  validates :release_id, presence: true
end
