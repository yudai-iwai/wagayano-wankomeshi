class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: 'wagayano@wankomeshi') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.password_confirmation = member.password
      member.name = 'ゲスト'
      member.dog_name = 'サンプル'
      member.dog_breed = 'サンプル'
      member.dog_age = 'サンプル'
      member.dog_gender = 'サンプル'
    end
  end

  has_one_attached :image
  has_many :post_recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローフォロワーの一覧画面を表示させる
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
end
