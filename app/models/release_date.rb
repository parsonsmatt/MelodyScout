class ReleaseDate < ActiveRecord::Base
  before_create :set_released
  
  validates :date, presence: true
  belongs_to :release
  belongs_to :notification, dependent: :destroy

  def release!
    release.release!(self) 
    self.released = true
    self.save
  end

  def self.daily_release
    ReleaseDate.where(date: Date.today).each(&:release!)
  end

  private

    def set_released
      self.released = date < Date.today
      true
    end
end
