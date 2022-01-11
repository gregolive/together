class Friendship < ApplicationRecord
  # - RELATIONS
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # - VALIDATIONS
  validates_presence_of :user_id, :friend_id
  validate :user_does_not_add_themself
  validates_uniqueness_of :user_id, scope: [:friend_id]

  def is_mutual
    self.friend.friends.include?(self.user)
  end

  private

  def user_does_not_add_themself
    errors.add(:friend, "can't be the same as the user") if self.user == self.friend
  end
end
