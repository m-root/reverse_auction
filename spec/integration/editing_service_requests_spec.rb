require 'spec_helper'

feature "Editing Auctions" do
  let!(:auction) { Factory(:auction) }
  let!(:patient) { Factory(:confirmed_patient) }
  let!(:auction) do
    auction = Factory(:auction)
    auction.update_attribute(:patient, patient)
    auction
  end

  before do
    sign_in_as!(type: "patient", user: patient)
    visit '/'
    click_link 'Current Service Requests'
    click_link auction.service
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
