FactoryGirl.define do
  factory :doctor do
    sequence(:email) { |n| "user#{n}@reverseauction.com" }
    password "password"
    password_confirmation "password"
  end
end
