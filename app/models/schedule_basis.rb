class ScheduleBasis < ApplicationRecord
  belongs_to :user
  has_many :task_bases, dependent: :destroy
end
