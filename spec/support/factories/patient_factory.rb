FactoryGirl.define do
  factory :patient do
    sequence(:email) { |n| "patient#{n}@reverseauction.com" }
    password "password"
    password_confirmation "password"

    factory :confirmed_patient do
      after_create do |patient|
        patient.confirm!
      end
    end
  end
end
