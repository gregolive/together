class Post < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  # - VALIDATIONS
  validates :body, presence: true

  def user_likes(user)
    likes.find { |like| like.user_id == user.id }
  end

  scope :feed_posts, lambda { |current_user|
    where('user_id IN (?) or user_id IN (?)', current_user, current_user.active_friends).order('created_at DESC')
  }
end
