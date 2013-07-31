require 'spec_helper'

feature 'Creating Auctions' do
  let!(:auction) { Factory(:auction) }

  scenario "patient can make an auction" do
    patient = Factory(:confirmed_patient)
    sign_in_as!(type: "patient", user: patient)
    visit '/'
    click_link 'Service Request'
    fill_in 'Service', with: 'Sinus Infection'
    fill_in 'Description', with: "Symptoms and details"
    click_button 'Create Auction'
    page.should have_content('Auction has been initiated.')
  end

  scenario "patient cannot create an auction without a service request" do
    patient = Factory(:confirmed_patient)
    sign_in_as!(type: "patient", user: patient)
    visit '/'
    click_link 'Service Request'
    click_button 'Create Auction'
    page.should have_content("Auction has not been initiated.")
    page.should have_content("Service can't be blank")
  end

  scenario "doctor cannot create an auction" do
    doctor = Factory(:confirmed_doctor)
    sign_in_as!(type: "doctor", user: doctor)
    visit '/'
    click_link 'Service Request'
    click_button 'Create Auction'
    page.should have_content("You are not authorized to do that")
  end
end
