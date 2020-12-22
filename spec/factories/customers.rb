FactoryBot.define do
  factory :customer do
    first_name "Aaron"
    last_name "Sumner"
    email "test@example.com"
    password "test-password"
  end
  #it "has a valid factory" do
  #expect(FactoryBot.build(:customer)).to be_valid
  #end
end
