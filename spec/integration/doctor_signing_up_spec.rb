require 'spec_helper'

feature 'Doctor Signing up' do
  scenario 'Successful doctor sign up' do
    visit '/'
    click_link 'Doctor Sign up'
    fill_in "Email", :with => "doctor@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    message = "Please open the link to activate your account."
    page.should have_content(message)
  end
end
