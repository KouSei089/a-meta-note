class Category < ApplicationRecord
  belongs_to :user
  has_many :task_categories, dependent: :destroy
  has_many :tasks, through: :task_categories
end
