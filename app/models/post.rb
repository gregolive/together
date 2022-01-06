class Post < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  has_many :comments, as: :commentable

  # - VALIDATIONS
  validates :body, presence: true
end
