class Notification < ActiveRecord::Base
  belongs_to :release
  belongs_to :release_date
  belongs_to :notice
end
