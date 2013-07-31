require 'spec_helper'

feature "Viewing bids" do
  before do
    sinus_infection = Factory(:auction, service: "Sinus Infection")
    doctor = Factory(:doctor)
    bid = Factory(:bid, auction: sinus_infection,
            lowest_bid: "30.00", maximum_bid: "100.00",
            additional_offers: "Free follow up appointment")
    bid.update_attribute(:doctor, doctor)

    need_vaccine = Factory(:auction, service: "Need Vaccine")
    Factory(:bid, auction: need_vaccine,
            lowest_bid: "20.00", maximum_bid: "45.00",
            additional_offers: "Free lollipop")

    visit '/'
  end

  scenario "Viewing bids for a given auction" do
    click_link "Sinus Infection"
    page.should have_content("30.00")
    page.should_not have_content("20.00")

    click_link "30.00"
    within("#bid h2") do
      page.should have_content("30.00")
    end
    page.should have_content("100.00")
    page.should have_content("Free follow up appointment")
  end
end
