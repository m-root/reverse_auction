require 'spec_helper'

feature 'Creating Auctions' do
  scenario "can make an auction" do
    visit '/'
    click_link 'Service Request'
    fill_in 'Service', with: 'Sinus Infection'
    fill_in 'Description', with: "Symptoms and details"
    click_button 'Create Auction'
    page.should have_content('Auction has been initiated.')
  end
end
