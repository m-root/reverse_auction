FactoryGirl.define do
  factory :doctor do
    sequence(:email) { |n| "doctor#{n}@reverseauction.com" }
    password "password"
    password_confirmation "password"

    factory :confirmed_doctor do
      after_create do |doctor|
        doctor.confirm!
      end
    end
  end
end
