class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  has_many :categories, dependent: :destroy

  def percent_calculation
    self.percent = ((((time_end - time_start) / 60) / 1440) * 100).round
  end
end
