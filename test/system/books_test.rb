# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = FactoryBot.create(:book)
    user = FactoryBot.create(:user)

    visit root_path
    assert_css 'h2', text: 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_on 'ログイン'
    assert_text 'ログインしました。'

    visit books_url
  end

  test 'visiting the index' do
    assert_selector 'h1', text: '本'
  end

  test 'visiting the show' do
    click_on '詳細'
    assert_selector 'h1', text: '本の詳細'
  end

  test 'creating a Book' do
    click_on '新規作成'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    attach_file '画像', Rails.root.join('test/fixtures/files/book.jpg')
    click_on '登録する'

    assert_text '本が作成されました。'
    click_on '戻る'
  end

  test 'updating a Book' do
    click_link '編集'

    fill_in 'タイトル', with: 'タイトル更新'
    fill_in 'メモ', with: 'メモ更新'
    fill_in '著者', with: '著者更新'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'タイトル更新'
    assert_text 'メモ更新'
    assert_text '著者更新'
    click_on '戻る'
  end

  test 'destroying a Book' do
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end

  test 'add comment in a Book' do
    click_link '詳細'

    fill_in 'comment[content]', with: 'コメント１'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text 'コメント１'
  end
end
