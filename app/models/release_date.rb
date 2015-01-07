class ReleaseDate < ActiveRecord::Base
  
  before_create :set_released
  
  validates :release, :date, presence: true
  belongs_to :release

  def release!
    release.release!(self) 
    self.released = true
    self.save
  end

  private

    def set_released
      self.released = date < Date.today
    end
end
