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