class Like < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
