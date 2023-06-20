class PostRecipe < ApplicationRecord
  has_one_attached :image
  belongs_to :member
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  
  validates :title, presence: true, length: { maximum: 15 }
  validates :introduction, presence: true
  validates :material_quantity, presence: true
  validates :recipe, presence: true
  
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  
  # 検索方法の分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post_recipe = PostRecipe.where("material_quantity LIKE?", "#{word}")
    elsif search == "forward_match"
      @post_recipe = PostRecipe.where("material_quantity LIKE?", "#{word}%")
    elsif search == "backward_match"
      @post_recipe = PostRecipe.where("material_quantity LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post_recipe = PostRecipe.where("material_quantity LIKE?", "%#{word}%")
    else
      @post_recipe = PostRecipe.all
    end
  end
  
end
