FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foobar#{n}@example.com"
    end
    password { SecureRandom.urlsafe_base64(16) }
    first_name "John"
    last_name  "Doe"
  end
end
