require 'rails_helper'
describe ContentsController, type: :request do

  before do
    @content = FactoryBot.create(:content)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
      get root_path
      expect(response.body).to include @content.title
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する" do 
    end
    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
    end
  end 

end