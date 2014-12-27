class Artist < ActiveRecord::Base
  
  validates :name, presence: true
  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions

  # Members:
  has_many :memberships, class_name: "Membership", foreign_key: "band_id", dependent: :destroy

  # Bands:
  has_many :bandships, class_name: "Membership", foreign_key: "member_id", dependent: :destroy

end
