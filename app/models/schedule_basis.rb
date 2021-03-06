class ScheduleBasis < ApplicationRecord
  belongs_to :user
  has_many :task_bases, dependent: :destroy

  validates :title, presence: true
  validates :pattren, presence: true
end
