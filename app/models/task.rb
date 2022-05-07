class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  def percent_calculation
    self.percent = ((((time_end - time_start) / 60) / 1440) * 100).round
  end
end
