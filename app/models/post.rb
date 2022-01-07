class Post < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  # - VALIDATIONS
  validates :body, presence: true
end
