class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  has_many :task_categories, dependent: :destroy
  has_many :categories, through: :task_categories

  validates :title, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :percent, presence: true

  scope :category_name_match, ->(task) { select { |category| category.name == task.category_name } }
end
