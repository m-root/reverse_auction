FactoryGirl.define do
  factory :doctor do
    sequence(:email) { |n| "doctor#{n}@reverseauction.com" }
    password "password"
    password_confirmation "password"
  end
end