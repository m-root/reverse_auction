require 'spec_helper'

feature 'Deleting tickets' do
  let!(:auction) { Factory(:auction) }
  let!(:bid) { Factory(:bid, auction: auction) }

  before do
    visit '/'
    click_link auction.service
    click_link bid.lowest_bid.to_s
  end

  scenario "Deleting a bid" do
    click_link "Delete Bid"
    page.should have_content("Bid has been deleted.")
    page.current_url.should == auction_url(auction)
  end
end
