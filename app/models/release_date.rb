class ReleaseDate < ActiveRecord::Base
  before_create :set_released
  
  validates :release, :date, presence: true
  belongs_to :release

  def release!
    release.release!(self) 
    self.released = true
    self.save
  end

  def ReleaseDate.daily_release
    ReleaseDate.where(date: Date.today).each(&:release!)
  end

  private

    def set_released
      self.released = date < Date.today
      true
    end
end
