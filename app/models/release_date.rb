class ReleaseDate < ActiveRecord::Base
  validates :release, :date, presence: true
  belongs_to :release

  def release!
    release.release!(self) 
    self.released = true
    self.save
  end
end
