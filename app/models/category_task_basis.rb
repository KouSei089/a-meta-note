class CategoryTaskBasis < ApplicationRecord
  belongs_to :task_basis
  belongs_to :category
end
