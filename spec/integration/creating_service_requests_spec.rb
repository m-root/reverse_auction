require 'spec_helper'

feature 'Creating Auctions' do
  let!(:auction) { Factory(:auction) }

  scenario "Only Patient can make an auction" do
    patient = Factory(:patient, email: "patient@example.com")
    patient.confirm!

    visit '/'
    click_link 'Service Request'
    page.should have_content ("You need to sign in or sign up before continuing.")

    fill_in "Email", with: "patient@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
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
