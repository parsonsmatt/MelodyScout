class Artist < ActiveRecord::Base
  # Members:
  has_many :members, class_name: "Membership",
                     foreign_key: "member_id",
                     dependent: :destroy

  # Bands:
  has_many :bands, class_name: "Membership",
                   foreign_key: "band_id",
                   dependent: :destroy

  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions
end
