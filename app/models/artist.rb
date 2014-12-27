class Artist < ActiveRecord::Base
  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions
end
