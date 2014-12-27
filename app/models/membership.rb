class Membership < ActiveRecord::Base
  belongs_to :band, class_name: "Artist"
  belongs_to :member, class_name: "Artist"
end
