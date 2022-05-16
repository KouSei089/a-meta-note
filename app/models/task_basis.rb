class TaskBasis < ApplicationRecord
  belongs_to :schedule_basis
  belongs_to :user
  has_many :category_task_bases, dependent: :destroy
  has_many :categories, through: :category_task_bases

  def percent_calculation
    if time_start > time_end
      start_parse = time_start.end_of_day - time_start
      end_parse = time_end - time_end.beginning_of_day
      self.percent = ((((end_parse + start_parse) / 60) / 1440) * 100).round
    else
      self.percent = ((((time_end - time_start) / 60) / 1440) * 100).round
    end
  end
end
