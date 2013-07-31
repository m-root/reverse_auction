require 'spec_helper'

feature "Viewing auctions" do
  scenario "Listing all auctions" do
    patient = Factory(:patient)
    auction = Factory.create(:auction, service: "Sinus Infection")
    auction.update_attribute(:patient, patient)

    visit '/'
    click_link "Sinus Infection"
    page.current_url.should == auction_url(auction)
  end
end
