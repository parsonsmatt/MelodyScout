class Artist < ActiveRecord::Base
  validates :name, presence: true
  
  # Releases:
  has_many :contributions
  has_many :releases, through: :contributions

  # Members:
  has_many :member_relations, class_name: "Membership", 
                              foreign_key: "group_id",
                              dependent: :destroy
  has_many :members, through: :member_relations

  # Bands:
  has_many :group_relations, class_name: "Membership",
                             foreign_key: "member_id",
                             dependent: :destroy
  has_many :groups, through: :group_relations

  # Followers:
  has_many :follows
  has_many :followers, through: :follows, source: :user

  def release!(notification)
    followers.each do |user|
      user.notify(notification)
    end
  end

  def add_member(other_artist)
    a=Membership.new(group: self, member: other_artist)
    a.save if a.valid?
  end

  def add_group(group)
    a=Membership.new(group: group, member: self)
    a.save if a.valid?
  end

  def add_group(group)
    Membership.create(group: group, member: self)
  end

  def add_release(release)
    contributions.create(release_id: release.try(:id))
  end

  def has_members?
    members.count > 0
  end

  def has_groups?
    groups.count > 0
  end

  def has_releases?
    releases.count > 0
  end

  def group?
    !individual?
  end

  private
end
