require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # - RELATIONS
  has_one_attached :avatar
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :received_friends, through: :received_friendships, source: :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      if auth.info.image
        downloaded_image = URI.open(auth.info.image)
        user.avatar.attach(io: downloaded_image,
                           filename: "image-#{Time.now.strftime("%s%L")}",
                           content_type: downloaded_image.content_type)
      end
    end
  end

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

  def friends_posts
    active_friends.select(&:posts)
  end

  def mutual_friends(user)
    friends.select { |friend| user.active_friends.include?(friend) }
  end

  def suggested_friends
    User.all.reject { |user| active_friends.include?(user) }
        .reject { |user| pending_friend_requests.include?(user) }
        .reject { |user| incoming_friend_requests.include?(user) }
        .reject { |user| user == self }
        .take(3)
  end

  def top_posts
    posts.sort_by { |post| post.likes.count + post.comments.count }.take(5).reverse
  end
end
