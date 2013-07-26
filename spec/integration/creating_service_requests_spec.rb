require 'spec_helper'

feature 'Creating Auctions' do
    before do
      visit '/'
      click_link 'Service Request'
    end

  scenario "can make an auction" do
    fill_in 'Service', with: 'Sinus Infection'
    fill_in 'Description', with: "Symptoms and details"
    click_button 'Create Auction'
    page.should have_content('Auction has been initiated.')
  end

  scenario "can not create an auction without a service request" do
    click_button 'Create Auction'
    page.should have_content("Auction has not been initiated.")
    page.should have_content("Service can't be blank")
  end
end
