require 'spec_helper'

feature "Editing Auctions" do
  before do
    Factory(:auction, service: "Sinus Infection")
    visit '/'
    click_link "Sinus Infection"
    click_link "Edit Auction"
  end

  scenario "Updating an auction" do
    fill_in "Service", with: "Sinus Infection and Cold"
    click_button "Update Auction"
    page.should have_content("Auction has been updated.")
  end

  scenario "Updating an auction with invalid attributes is bad" do
    fill_in "Service", with: ""
    click_button "Update Auction"
    page.should have_content("Auction has not been updated.")
  end
end
