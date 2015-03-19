FactoryGirl.define do
  factory :project do
    owner(:user)
    name { Faker::Company.name }
    currency "USD"
  end
end
