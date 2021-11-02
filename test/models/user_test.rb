# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email" do
    user = FactoryBot.create(:user)
    assert_equal user.name, user.name_or_email

    user.name = ''
    assert_equal user.email, user.name_or_email
  end

  test "#follow/unfollow" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    assert_not user1.following?(user2)
    assert_not user2.followed_by?(user1)
    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followed_by?(user1)

    user1.unfollow(user2)
    assert_not user1.following?(user2)
    assert_not user2.followed_by?(user1)
  end
end
