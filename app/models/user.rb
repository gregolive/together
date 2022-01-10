class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # - RELATIONS
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :posts
  has_many :comments
  has_many :liked_posts, through: :likes, source: :post
  has_many :liked_comments, through: :likes, source: :comment
end
