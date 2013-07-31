require 'spec_helper'

feature 'Creating Auctions' do
  let!(:auction) { Factory(:auction) }

  scenario "Only patient can make an auction" do
    patient = Factory(:patient, email: "patient@example.com")
    patient.confirm!
    sign_in_as!(type: "patient", user: patient)

    visit '/'
    click_link 'Service Request'
    within("h2") { page.should have_content("Service Request") }

    fill_in 'Service', with: 'Sinus Infection'
    fill_in 'Description', with: "Symptoms and details"
    click_button 'Create Auction'
    page.should have_content('Auction has been initiated.')
    within("#requester") do
      page.should have_content("Requested by patient@example.com")
    end
  end

  scenario "Patient cannot create an auction without a service request" do
    patient = Factory(:confirmed_patient)
    sign_in_as!(type: "patient", user: patient)

    visit '/'
    click_link 'Service Request'

    click_button 'Create Auction'
    page.should have_content("Auction has not been initiated.")
    page.should have_content("Service can't be blank")
  end
end
