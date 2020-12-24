require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe 'topページ' do
    context "topページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ようこそ！Corona de Happy Weddingへ")
      end
    end
  end
  describe 'aboutページ' do
    context "aboutページが正しく表示される" do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("About")
      end
    end
  end
  describe 'newページ' do
    context "newページが正しく表示される" do
      before do
        get new_customers_article_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("About")
      end
    end
  end
  describe 'indexページ' do
    context "indexページが正しく表示される" do
      before do
        get  customers_articles_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("Wedding Article一覧")
      end
    end
  end
  describe 'showページ' do
    let(:customer) { FactoryBot.create(:customer) }
    let(:article) { FactoryBot.create(:article, customer: customer) }
    context "showページが正しく表示される" do
      before do
        get  customers_article_path(article.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("カテゴリー")
      end
    end
  end
end