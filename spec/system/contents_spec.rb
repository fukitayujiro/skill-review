require 'rails_helper'

RSpec.describe "Contents", type: :system do
  before do
    @content = FactoryBot.create(:content)
    @content_title = "111112222233333"
  end
  context 'コンテンツ投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @content.user.email
      fill_in 'user[password]', with: @content.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_content_path
      # フォームに情報を入力する ※画像は必須ではない
      fill_in 'content[title]', with: @content_title
      fill_in 'content[introduction]', with: @content.introduction
      select "書籍", from: "content[media_id]"
      select "経営", from: "content[genre_id]"
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{ Content.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する
      expect(page).to have_content(@content_title)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 投稿ページに移動する
      visit new_content_path
      # トップページに遷移する
      expect(current_path).to eq root_path
    end
  end
end