require 'rails_helper'

RSpec.describe Article, type: :model do
  context "データが正しく保存される" do
      before do
        @article = Article.new
        @article.id = 1
        @article.category_id = 1
        @article.image_id = "image"
        @article.title = "ウエディング"
        @article.introduction = "結婚式を控える新郎新婦。"
        @article.created_at = "2020/12/22"
        @article.updated_at = "2020/12/23"
        @article.save
      end
      it "全て入力してあるので保存される" do
        expect(@article).to be_valid
      end
  end
  context "データが正しく保存されない" do
    before do
      @article = Article.new
      @article.id = 1
      @article.category_id = 1
      @article.image_id = "image"
      @article.title = ""
      @article.introduction = "結婚式を控える新郎新婦。"
      @article.created_at = "2020/12/22"
      @article.updated_at = "2020/12/23"
      @article.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@article).to be_invalid
      expect(@article.errors[:title]).to include("can't be blank")
    end
  end
end