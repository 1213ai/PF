class HowToMake < ApplicationRecord
  belongs_to :recipe
  validates :explanation, presence: true, length: { maximum: 200 }
end
