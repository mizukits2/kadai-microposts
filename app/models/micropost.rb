class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  def like(user)
    likes.create(user_id: user.id)
  end
  
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
end
