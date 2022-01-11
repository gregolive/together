class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # - RELATIONS
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :received_friends, through: :received_friendships, source: :user
  has_many :posts
  has_many :comments
  has_many :likes

  def active_friends
    friends.select { |friend| friend.friends.include?(self) }
  end

  def pending_friend_requests
    friends.reject { |friend| friend.friends.include?(self) }
  end

  def incoming_friend_requests
    received_friends.select { |received_friend| received_friend.friends.include?(self) }
                    .reject { |received_friend| friends.include?(received_friend) }
  end

  def friendship_request(user)
    friendships.select { |friendships| friendships.friend == user }
  end
end
