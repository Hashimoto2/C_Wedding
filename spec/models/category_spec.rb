require 'rails_helper'

RSpec.describe Category, type: :model do
  context "データが正しく保存される" do
      before do
        @category = Category.new
        @category.name = "ウエディング"
        @category.is_active = true
        @category.created_at = "2020/12/22"
        @category.updated_at = "2020/12/23"
        @category.save
      end
      it "全て入力してあるので保存される" do
        expect(@category).to be_valid
      end
  end
  context "データが正しく保存されない" do
    before do
      @category = Category.new
      @category.name = ""
      @category.is_active = true
      @category.created_at = "2020/12/22"
      @category.updated_at = "2020/12/23"
      @category.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@category).to be_invalid
      expect(@category.errors[:name]).to include("can't be blank")
    end
  end
end