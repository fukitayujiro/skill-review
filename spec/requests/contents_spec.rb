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

  describe "GET #concept" do
    it "conceptアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "conceptアクションにリクエストするとレスポンスに〜のテキストが存在する" do
    end
  end

  describe "GET #new" do
    it "newアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "newアクションにリクエストするとレスポンスに「投稿画面」のテキストが存在する" do
    end
  end

  describe "GET #create" do
    it "createアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "createアクションにリクエストするとレスポンスがトップページのテキストが存在する" do
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get content_path(@content)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do 
      get content_path(@content)
      expect(response.body).to include @content.title
    end
    it "showアクションにリクエストするとレスポンスに「口コミ投稿一覧」のテキストが存在する" do 
      get content_path(@content)
      expect(response.body).to include "口コミ投稿一覧"
    end
  end 

  describe "GET #edit" do
    it "editアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "editアクションにリクエストするとレスポンスが「編集画面」のテキストが存在する" do
    end
  end

  describe "GET #destroy" do
    it "destroyアクションにリクエストすると正常にレスポンスが返ってくる" do 
    end
    it "destroyアクションにリクエストするとレスポンスにトップページのテキストが存在する" do
    end
  end

end