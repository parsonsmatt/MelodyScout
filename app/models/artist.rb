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

  def add_member(other_artist)
    member_relations.create(member_id: other_artist.id)
  end

  def add_release(release)
    contributions.create(release_id: release.id)
  end
end
