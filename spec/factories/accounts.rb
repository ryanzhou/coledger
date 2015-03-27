FactoryGirl.define do
  factory :account do
    project
    name { Faker::Company.name }
    account_type :income
  end
end
