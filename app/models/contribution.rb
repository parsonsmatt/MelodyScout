class Contribution < ActiveRecord::Base
  belongs_to :artist
  belongs_to :release

  validates :artist, presence: true, uniqueness: { scope: :release }
  validates :release, presence: true, uniqueness: { scope: :artist }
end
