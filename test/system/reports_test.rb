# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    user = FactoryBot.create(:user)
    @report = FactoryBot.create(:report, user_id: user.id)

    visit root_path
    assert_css 'h2', text: 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_on 'ログイン'
    assert_text 'ログインしました。'

    visit reports_url
  end

  test 'visiting the index' do
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    click_on '新規作成'

    fill_in 'タイトル', with: 'タイトルの日報'
    fill_in '内容', with: '内容の日報'
    click_on '登録する'

    assert_text '日報が作成されました。'
  end

  test 'visiting the show' do
    click_on '詳細'
    assert_selector 'h1', text: '日報の詳細'
  end

  test 'add comment to report' do
    click_on '詳細'

    fill_in 'comment[content]', with: 'コメント１の日報'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text 'コメント１の日報'
  end

  test 'edit report' do
    click_on '編集'
    assert_text '日報の編集'

    fill_in 'タイトル', with: 'タイトル更新'
    fill_in '内容', with: '内容更新'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'タイトル更新'
    assert_text '内容更新'
  end

  test 'delete report' do
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
