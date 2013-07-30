require 'spec_helper'

feature 'Patient Signing in' do
  before do
    Factory(:patient, :email => "patient@example.com")
  end

  scenario 'Patient Signing in via confirmation' do
    open_email "patient@example.com", with_subject: /Confirmation/
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as patient@example.com")
  end

  scenario 'Patient Signing in via form' do
    Patient.find_by_email('patient@example.com').confirm!
    visit '/'
    click_link 'Patient Sign in'
    fill_in 'Email', with: "patient@example.com"
    fill_in 'Password', with: "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
