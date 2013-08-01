require 'spec_helper'

feature "Deleting auctions" do
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
  end

  scenario "Deleting an auction" do
    click_link "Delete Auction"
    page.should have_content("Auction has been deleted.")

    visit '/'
    page.should_not have_content("Sinus Infection")
  end
end
