require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージ投稿機能' do
    context 'メッセージ投稿がうまくいくとき' do
      it "項目が全て埋まっている時" do
        expect(@message).to be_valid
      end
    end
    context 'コンテンツ投稿がうまくいかない時' do
      it "pointが洗濯してください以外の時" do
        @message.point = "1"
        @content.valid?
        expect(@message.errors.full_messages).to include("Point must be other than 1")
      end
      it "introductionが空の時" do
        @content.text = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end