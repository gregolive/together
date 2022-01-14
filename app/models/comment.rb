class Comment < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  # - VALIDATIONS
  validates :content, presence: true

  def user_likes(user)
    likes.find { |like| like.user_id == user.id }
  end
end
