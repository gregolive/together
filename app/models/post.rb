class Post < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  # - VALIDATIONS
  validates :body, presence: true

  scope :feed_posts, lambda { |current_user|
    where('user_id IN (?) or user_id IN (?)', current_user, current_user.active_friends).order('created_at DESC')
  }

  def user_likes(user)
    likes.find { |like| like.user_id == user.id }
  end
end
