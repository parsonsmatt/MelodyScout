class Contribution < ActiveRecord::Base
  belongs_to :artist
  belongs_to :release

  validates :artist_id, presence: true, uniqueness: { scope: :release_id }
  validates :release_id, presence: true, uniqueness: {scope: :artist_id }
end
