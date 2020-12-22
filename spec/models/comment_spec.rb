require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "データが正しく保存される" do
      before do
        @comment = Comment.new
        @comment.comment = "とても参考になりました。"
        @comment.created_at = "2020/12/22"
        @comment.updated_at = "2020/12/23"
        @comment.save
      end
      it "全て入力してあるので保存される" do
        expect(@comment).to be_valid
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