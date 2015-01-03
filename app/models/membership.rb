class Membership < ActiveRecord::Base
  belongs_to :group, class_name: "Artist"
  belongs_to :member, class_name: "Artist"

  validates :group, presence: true, uniqueness: { scope: :member }
  validates :member, presence: true, uniqueness: { scope: :group }

  validate :cannot_relate_to_self, :cannot_symmetric_relation

  private

    def cannot_relate_to_self
      if group == member
        errors.add(:group, " can't relate to self.")
      end
    end

    def cannot_symmetric_relation
      if Membership.where(group: member, member: group).any?
        errors.add(:group, " can't relate symmetrically.")
      end
    end

end
