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
  has_many :band_relations,  class_name: "Membership",
                             foreign_key: "member_id",
                             dependent: :destroy
  has_many :bands, through: :band_relations

  # Followers:
  has_many :follows
  has_many :followers, through: :follows, source: :user

  def add_member(other_artist)
    member_relations.create(member_id: other_artist.try(:id))
  end
  
  def add_band(band)
    band_relations.create(band_id: band.try(:id))
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

  def group?
    !individual?
  end

  private
end
