class Artist < ActiveRecord::Base
  # Members:
  has_many :memberships
  has_many :artists, through: :memberships

  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions
end
