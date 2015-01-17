class Contribution < ActiveRecord::Base
  belongs_to :artist
  belongs_to :release

  validates :artist_id, uniqueness: { scope: :release_id }
  validates :release_id, uniqueness: { scope: :artist_id }
end
