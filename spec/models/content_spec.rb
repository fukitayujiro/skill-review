require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end
  describe 'コンテンツ投稿機能' do
    context 'コンテンツ投稿がうまくいくとき' do
      it "項目が全て埋まっている時" do
        expect(@content).to be_valid
      end
    end
    context 'コンテンツ投稿がうまくいかない時' do
      it "titleが空の時" do
        @content.title = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Title can't be blank")
      end
      it "introductionが空の時" do
        @content.introduction = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Introduction can't be blank")
      end
      it "media_idが1の時" do
        @content.media_id = "1"
        @content.valid?
        expect(@content.errors.full_messages).to include("Media must be other than 1")
      end
      it "genre_idが1の時" do
        @content.genre_id = "1"
        @content.valid?
        expect(@content.errors.full_messages).to include("Genre must be other than 1")
      end
    end
  end
end



