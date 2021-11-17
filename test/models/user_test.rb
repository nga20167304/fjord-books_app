# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user1.follow(@user2)
  end

  test '#name_or_email' do
    assert_equal @user1.name, @user1.name_or_email

    @user1.name = ''
    assert_equal @user1.email, @user1.name_or_email
  end

  test '#following?' do
    assert @user1.following?(@user2)
    assert_not @user2.following?(@user1)
  end

  test '#followed_by?' do
    assert @user2.followed_by?(@user1)
    assert_not @user1.followed_by?(@user2)
  end

  test '#follow' do
    assert @user1.following?(@user2)
    assert @user2.followed_by?(@user1)
  end

  test '#unfollow' do
    @user1.unfollow(@user2)
    assert_not @user1.following?(@user2)
    assert_not @user2.followed_by?(@user1)
  end
end
