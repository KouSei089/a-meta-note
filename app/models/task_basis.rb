class TaskBasis < ApplicationRecord
  belongs_to :schedule_basis
  belongs_to :user
  has_many :category_task_bases, dependent: :destroy
  has_many :categories, through: :category_task_bases
end
