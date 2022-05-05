class Task < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  has_many :categories, dependent: :destroy
end
