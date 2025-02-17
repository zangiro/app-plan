class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :is_public, inclusion: { in: [ true, false ], message: "@を選んでください" }
  validate :agreement

  has_many :posts, dependent: :destroy
  has_many :playlists, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  has_many :view_histories, dependent: :destroy
  has_many :view_history_posts, through: :view_histories, source: :post

  has_one_attached :avatar

  attr_accessor :agree_terms

  def agreement
    if new_record?
      unless agree_terms == "1" || agree_terms == true
        errors.add(:base, "@利用規約に同意されてません")
      end
    end
  end

  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.destroy(post)
  end

  def like?(post)
    like_posts.include?(post)
  end

  def own?(object)
    id == object&.user_id
  end
  # current_user.own?(comment)と使い、コメントの作成者がログイン中のユーザーのものか確認してる
end
