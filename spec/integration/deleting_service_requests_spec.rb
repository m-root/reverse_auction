require 'spec_helper'

feature "Deleting auctions" do
  scenario "Deleting an auction" do
    Factory(:auction, service: "Sinus Infection")
    visit '/'
    click_link "Sinus Infection"
    click_link "Delete Auction"
    page.should have_content("Auction has been deleted.")

    visit '/'
    page.should_not have_content("Sinus Infection")
  end
end
