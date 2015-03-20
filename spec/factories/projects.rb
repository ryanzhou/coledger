FactoryGirl.define do
  factory :project do
    owner(:user)
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    currency "USD"
  end
end
