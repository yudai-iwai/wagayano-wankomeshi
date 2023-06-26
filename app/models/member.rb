class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストログイン用のコード
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

  # フォロー・フォロワーに関するコード
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 通報に関するコード
  has_many :reports, class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :reverse_of_reports, class_name: "Report", foreign_key: "reported_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 8 }
  validates :dog_name, presence: true, length: { maximum: 15 }
  validates :dog_breed, presence: true
  validates :dog_age, presence: true
  validates :dog_gender, presence: true

  def follow(member_id)
    relationships.create(followed_id: member_id)
  end

  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end

  def following?(member)
    followings.include?(member)
  end

  # ログイン時に退会済みのユーザーが同じアカウントでログインできないよう制約を設ける
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 会員のステータス
  def boolean_label(value)
    value ? '退会' : '有効'
  end

  # 検索方法の分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @member = Member.where("dog_breed LIKE?", "#{word}")
    elsif search == "forward_match"
      @member = Member.where("dog_breed LIKE?", "#{word}%")
    elsif search == "backward_match"
      @member = Member.where("dog_breed LIKE?", "%#{word}")
    elsif search == "partial_match"
      @member = Member.where("dog_breed LIKE?", "%#{word}%")
    else
      @member = Member.all
    end
  end

end