class Post < ApplicationRecord
  # - RELATIONS
  belongs_to :user

  # - VALIDATIONS
  validates :body, presence: true
end
