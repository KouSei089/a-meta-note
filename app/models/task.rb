class Task < ApplicationRecord
  belongs_to :schedule
  has many :categories, dependent: :destroy
end
