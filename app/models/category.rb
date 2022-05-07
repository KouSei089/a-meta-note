class Category < ApplicationRecord
  belongs_to :user

  # serialize :name, Array
  # serialize :color_id, Array
end
