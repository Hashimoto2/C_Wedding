require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "データが正しく保存される" do
      before do
        @article = Article.create(title:"ウエディング", introduction:"結婚式。", image_id:"image")
        @customer = Customer.create(email:"aa@aa.com", last_name:"山田", first_name:"花子", last_name_kana:"ヤマダ", first_name_kana:"ハナコ", password:"11641164")
        @comment = Comment.create(comment:"とても参考になりました。", rate:"1", article: @article, customer: @customer)
      end
      it "全て入力してあるので保存される" do
        expect(@comment).to be_valid
        expect(@comment.comment).to eq 'とても参考になりました。'
      end
  end
  context "データが正しく保存されない" do
    before do
      @comment = Comment.new
      @comment.comment = ""
      @comment.created_at = "2020/12/22"
      @comment.updated_at = "2020/12/23"
      @comment.save
    end
    it "commentが入力されていないので保存されない" do
      expect(@comment).to be_invalid
      expect(@comment.errors[:comment]).to include("can't be blank")
    end
  end
end