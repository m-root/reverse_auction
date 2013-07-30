require 'spec_helper'

feature "Viewing auctions" do
  scenario "Listing all auctions" do
    auction = Factory.create(:auction, service: "Sinus Infection")
    visit '/'
    click_link "Sinus Infection"
    page.current_url.should == auction_url(auction)
  end
end
