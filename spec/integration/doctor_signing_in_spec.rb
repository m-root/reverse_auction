require 'spec_helper'

feature 'Doctor Signing in' do
  before do
    Factory(:doctor, email: "doctor@example.com")
  end

  scenario 'Doctor Signing in via confirmation' do
    open_email "doctor@example.com", with_subject: /Confirmation/
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as doctor@example.com")
  end
end
