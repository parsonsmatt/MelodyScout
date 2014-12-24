class Release < ActiveRecord::Base
  has_many :contributions
  has_many :artists, through: :contributions
end
