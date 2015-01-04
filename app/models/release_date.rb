class ReleaseDate < ActiveRecord::Base
  validates :release, :date, presence: true
  belongs_to :release
end
