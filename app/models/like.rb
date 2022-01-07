class Like < ApplicationRecord
  # - RELATIONS
  belongs_to :likeable, polymorphic: true
end
