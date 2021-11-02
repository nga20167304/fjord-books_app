# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end
  
  test "#name_or_email" do
    assert_equal @user1.name, @user1.name_or_email

    @user1.name = ''
    assert_equal @user1.email, @user1.name_or_email
  end

  test "#follow/unfollow" do
    assert_not @user1.following?(@user2)
    assert_not @user2.followed_by?(@user1)
    @user1.follow(@user2)
    assert @user1.following?(@user2)
    assert @user2.followed_by?(@user1)

    @user1.unfollow(@user2)
    assert_not @user1.following?(@user2)
    assert_not @user2.followed_by?(@user1)
  end
end
