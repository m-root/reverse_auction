FactoryGirl.define do
  factory :bid do
    lowest_bid "10.00"
    maximum_bid "100.00"
    additional_offers "example offers"
    association :doctor
  end
end
