# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    user = FactoryBot.create(:user)

    visit root_path
    assert_css 'h2', text: 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_on 'ログイン'
    assert_text 'ログインしました。'

    visit users_url
  end

  test 'visiting the index' do
    assert_selector 'h1', text: 'ユーザ'
  end

  test 'visting the show' do
    click_on '詳細'
    assert_selector 'h1', text: 'ユーザの詳細'
  end

  test 'follow/unfollow user' do
    user1 = FactoryBot.create(:user)
    visit user_path(user1)

    click_on 'フォローする'
    assert_text 'フォローしました。'

    click_on 'フォロー解除する'
    assert_text 'フォロー解除しました。'
  end

  test 'logout' do
    click_on 'ログアウト'
    assert_text 'ログアウトしました。'
  end

  test 'edit user' do
    click_on 'アカウント編集'
    assert_selector 'h2', text: 'アカウント編集'

    fill_in 'Eメール', with: 'email-change@gmail.com'
    fill_in '氏名', with: '氏名更新'
    fill_in '郵便番号', with: '郵便番号更新'
    fill_in '自己紹介文', with: '自己紹介文更新'
    fill_in 'パスワード', with: 'password123'
    fill_in 'パスワード（確認用）', with: 'password123'
    fill_in '現在のパスワード', with: 'password'

    click_on '更新'
    assert_text 'アカウント情報を変更しました。'
  end

  test 'delete user' do
    click_on 'アカウント編集'

    page.accept_confirm do
      click_on 'アカウント削除', match: :first
    end

    assert_text 'アカウントを削除しました。'
  end
end
