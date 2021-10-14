class RecipeComment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :comment, presence: true
end
