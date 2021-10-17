class Recipe < ApplicationRecord
  belongs_to :user

  attachment :image
  has_many :recipe_ingredients, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, :how_to_makes, allow_destroy: true
  validates :title, presence: true
  validates :catchcopy, presence: true, length: { maximum: 200 }

  has_many :favorites, dependent: :destroy

  has_many :recipe_comments, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def user
    return User.find_by(id: self.user_id)
  end

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:recipe_id).order(Arel.sql('count(recipe_id) desc')).pluck(:recipe_id))
    when 'dislikes'
      return find(Favorite.group(:recipe_id).order(Arel.sql('count(recipe_id) asc')).pluck(:recipe_id))
    end
  end


end
