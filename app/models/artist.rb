class Artist < ActiveRecord::Base
  validates :name, presence: true
  
  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions

  # Members:
  has_many :memberships
  has_many :members, through: :memberships
  
  # Bands:
  has_many :bands, through: :memberships

  def add_member(other_artist)
    members.create(member_id: other_artist.id)
  end

  def add_release(release)
    releases.create(release_id: release.id)
  end
end
