class Category < ApplicationRecord
  belongs_to :user

  serialize :name, Array
  serialize :color, Array
end
