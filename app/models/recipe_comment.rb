class RecipeComment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :comment, length: { maximum: 150 }, presence: true
end
