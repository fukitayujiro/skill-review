require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @content = FactoryBot.create(:content)
    @message_text = "111111"
  end
  context 'コメント投稿できる時'do
    it 'ログインしたユーザーはコメント投稿できる' do
      # 新規登録する
      visit new_user_registration_path
      fill_in 'user[name]', with: ("another")
      fill_in 'user[email]', with: ("another@1111")
      fill_in 'user[password]', with: ("another1111")
      fill_in 'user[password_confirmation]', with: ("another1111")
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへ遷移
      visit content_path(@content)
      # フォームに情報を入力する
      select "3", from: "message[point]"
      fill_in 'message[text]', with: @message_text
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{ Message.count }.by(1)
      # 同じ詳細ページに遷移する
      expect(current_path).to eq content_path(@content)
      # トップページには先ほど投稿した内容のツイートが存在することを確認する
      expect(page).to have_content(@message_text)
    end
  end
  context 'コメント投稿ができないとき'do
    it 'ログインしていないとコメント画面が表示されない' do
      # 詳細ページへ遷移
      visit content_path(@content)
      # フォームに情報を入力する
      expect(page).to have_content("コメントの投稿には新規登録/ログインが必要です")
    end
  end
end