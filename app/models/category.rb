class Category < ApplicationRecord
  belongs_to :user

  #serialize :name, Array
  #serialize :color_id, Array

  include ActiveHash::Associations
  has_many :colors
end
