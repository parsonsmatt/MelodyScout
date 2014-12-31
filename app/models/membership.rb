class Membership < ActiveRecord::Base
  belongs_to :band, class_name: "Artist"
  belongs_to :member, class_name: "Artist"

  validates :band, presence: true, uniqueness: { scope: :member }
  validates :member, presence: true, uniqueness: { scope: :band }

  validate :cannot_relate_to_self, :cannot_symmetric_relation

  private

    def cannot_relate_to_self
      if band == member
        errors.add(:band, " can't relate to self.")
      end
    end

    def cannot_symmetric_relation
      if Membership.where(band: member, member: band).any?
        errors.add(:band, " can't relate symmetrically.")
      end
    end

end
