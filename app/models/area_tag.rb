class AreaTag < ApplicationRecord
  validates :name, presence: true

  has_many :post_area_tags, dependent: :destroy
  has_many :posts, through: :post_area_tags

  scope :active_users, -> { joins(posts: :user).where.not(users: { account_status: ACCOUNT_STATUS_INACTIVE }) }

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "post" ]
  end
end
