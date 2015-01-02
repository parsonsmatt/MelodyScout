class Artist < ActiveRecord::Base
  validates :name, presence: true
  
  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions

  # Members:
  has_many :member_relations, class_name: "Membership", 
                              foreign_key: "band_id",
                              dependent: :destroy
  has_many :members, through: :member_relations

  # Bands:
  has_many :band_relations, class_name: "Membership",
                             foreign_key: "member_id",
                             dependent: :destroy
  has_many :bands, through: :band_relations

  # Followers:
  has_many :follows
  has_many :followers, through: :follows, source: :user

  def add_member(other_artist)
    a=Membership.new(band: self, member: other_artist)
    a.save if a.valid?
  end

  # Really need to remove all references to 'band'...
  def add_band(band)
    a=Membership.new(band: band, member: self)
    a.save if a.valid?
  end

  def add_group(group)
    Membership.create(band: group, member: self)
  end

  def add_release(release)
    contributions.create(release_id: release.try(:id))
  end

  def has_members?
    members.count > 0
  end

  def has_bands?
    bands.count > 0
  end

  def has_releases?
    releases.count > 0
  end

  def band?
    !individual?
  end

  private
end
