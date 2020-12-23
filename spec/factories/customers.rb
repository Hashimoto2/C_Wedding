FactoryBot.define do
  factory :customer do
    first_name "花子"
    last_name "山田"
    last_name_kana "ヤマダ"
    first_name_kana"ハナコ"
    email "test@example.com"
    password "test-password"
  end
  # 有効なファクトリを持つこと
  # it "has a valid factory" do
  #   customer = Customer.build(:customer)
  #   expect(customer).to be_valid
  # end
end
