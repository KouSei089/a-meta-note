class TaskBasis < ApplicationRecord
  belongs_to :schedule_basis
  belongs_to :user
  has_many :category_task_bases, dependent: :destroy
  has_many :categories, through: :category_task_bases

  validates :title, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :percent, presence: true
end
