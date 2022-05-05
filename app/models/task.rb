class Task < ApplicationRecord
  belongs_to :schedule
  has_many :categories, dependent: :destroy
end
