FactoryGirl.define do
  factory :patient do
    sequence(:email) { |n| "patient#{n}@reverseauction.com" }
    password "password"
    password_confirmation "password"
  end
end
