require 'spec_helper'

feature 'Patient Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Patient Sign Up'
    fill_in "Email", :with => "patient@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Create Profile"
    message = "Please open the link to activate your account."
    page.should have_content(message)
  end
end

