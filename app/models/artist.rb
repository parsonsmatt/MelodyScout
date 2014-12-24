class Artist < ActiveRecord::Base
  has_many :contributions
  has_many :releases, through :contributions
end
