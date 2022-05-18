class Category < ApplicationRecord
  belongs_to :user
  has_many :task_categories, dependent: :destroy
  has_many :tasks, through: :task_categories
  has_many :category_task_bases, dependent: :destroy
  has_many :task_bases, through: :category_task_bases

  validates :name, presence: true
  validates :color, presence: true
  validates :color_code, presence: true
end
