require 'spec_helper'

feature "Creating Bids" do
  before do
    Factory(:auction, service: "Need Vaccine")
    visit '/'
    click_link "Need Vaccine"
    click_link "New Bid"
  end

  scenario "Creating a bid" do
    fill_in "Maximum bid", with: "45.00"
    fill_in "Lowest bid", with: "20.00"
    fill_in "Additional offers", with: "Free lollipop"
    click_button "Create Bid"
    page.should have_content("Bid has been created.")
  end

  scenario "Creating a bid with no values fails" do
    click_button "Create Bid"
    page.should have_content("Bid has not been created.")
    page.should have_content("Maximum bid can't be blank")
    page.should have_content("Lowest bid can't be blank")
  end

  scenario "Creating a bid with negative values fails" do
    fill_in "Maximum bid", with: "-1.00"
    fill_in "Lowest bid", with: "-1.00"
    click_button "Create Bid"
    page.should have_content("Bid has not been created.")
    page.should have_content("Maximum bid must be greater than 0")
    page.should have_content("Lowest bid must be greater than or equal to 0")
  end
end
