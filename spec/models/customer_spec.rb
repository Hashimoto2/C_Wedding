require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "データが正しく保存される" do
      before do
        @customer = Customer.new
        @customer.email = "aaa@aa.com"
        @customer.is_deleted = true
        @customer.last_name = "山田"
        @customer.first_name = "花子"
        @customer.last_name_kana = "ヤマダ"
        @customer.first_name_kana = "ハナコ"
        @customer.created_at = "2020/12/22"
        @customer.updated_at = "2020/12/23"
        @customer.save
      end
      it "全て入力してあるので保存される" do
        expect(@customer).to be_valid
      end
  end
  context "データが正しく保存されない" do
    before do
      @customer = Customer.new
      @customer.email = "aaa@aa.com"
      @customer.is_deleted = true
      @customer.last_name = ""
      @customer.first_name = "花子"
      @customer.last_name_kana = "ヤマダ"
      @customer.first_name_kana = "ハナコ"
      @customer.created_at = "2020/12/22"
      @customer.updated_at = "2020/12/23"
      @customer.save
    end
    it "last_nameが入力されていないので保存されない" do
      expect(@customer).to be_invalid
      expect(@customer.errors[:last_name]).to include("can't be blank")
    end
  end
end