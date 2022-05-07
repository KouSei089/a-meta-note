class Category < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :colors

  serialize :name, Array
  serialize :color, Array
end
