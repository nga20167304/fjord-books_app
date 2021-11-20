# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  test '#name_or_email' do
    assert_equal @user1.name, @user1.name_or_email

    @user1.name = ''
    assert_equal @user1.email, @user1.name_or_email
  end

  test '#following?' do
    @user1.followings << @user2
    assert @user1.following?(@user2)
    assert_not @user2.following?(@user1)
  end

  test '#followed_by?' do
    @user2.followers << @user1
    assert @user2.followed_by?(@user1)
    assert_not @user1.followed_by?(@user2)
  end

  test '#follow' do
    @user1.follow(@user2)
    assert_equal @user1.followings.count, 1
    assert_equal @user2.followers.count, 1
  end

  test '#unfollow' do
    @user1.unfollow(@user2)
    assert_equal @user1.followings.count, 0
    assert_equal @user2.followers.count, 0
  end
end
