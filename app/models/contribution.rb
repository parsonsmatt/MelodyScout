class Contribution < ActiveRecord::Base
  belongs_to :artist_id
  belongs_to :release_id
end
