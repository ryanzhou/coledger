FactoryGirl.define do
  factory :membership do
    project
    user
    role :admin
  end
end
