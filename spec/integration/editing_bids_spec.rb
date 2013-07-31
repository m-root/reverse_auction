require 'spec_helper'

feature "Editing bids" do
  let!(:auction) { Factory(:auction) }
  let!(:bid) { Factory(:bid, auction: auction) }

  before do
    visit '/'
    click_link auction.service
    click_link bid.lowest_bid.to_s
    click_link "Edit Bid"
  end

  scenario "Updating a bid" do
    fill_in "Lowest bid", with: "15.00"
    click_button "Update Bid"
    page.should have_content "Bid has been updated."
    within("#bid h2") do
      page.should have_content("15.00")
    end
    page.should_not have_content bid.lowest_bid.to_s
  end

  scenario "Updating a bid with invalid information" do
    fill_in "Lowest bid", with: "-15.00"
    click_button "Update Bid"
    page.should have_content("Bid has not been updated.")
  end
end
