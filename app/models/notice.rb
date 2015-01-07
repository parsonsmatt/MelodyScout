class Notice < ActiveRecord::Base
  belongs_to :user
  belongs_to :notification

  validates :notification_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, uniqueness: { scope: :notification_id }
end
