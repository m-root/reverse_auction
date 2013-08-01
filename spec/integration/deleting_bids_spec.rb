require 'spec_helper'

feature 'Deleting tickets' do
  let!(:auction) { Factory(:auction) }
  let!(:doctor) { Factory(:confirmed_doctor) }
  let!(:bid) do
    bid = Factory(:bid, auction: auction)
    bid.update_attribute(:doctor, doctor)
    bid
  end

  before do
    sign_in_as!(type: "doctor", user: doctor)
    visit '/'
    click_link 'Current Service Requests'
    click_link auction.service
    click_link bid.lowest_bid.to_s
  end

  scenario "Deleting a bid" do
    click_link "Delete Bid"
    page.should have_content("Bid has been deleted.")
    page.current_url.should == auction_url(auction)
  end
end
