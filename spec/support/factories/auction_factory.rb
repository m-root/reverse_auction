FactoryGirl.define do
  factory :auction do
    service "Example service request"
    association :patient
  end
end
