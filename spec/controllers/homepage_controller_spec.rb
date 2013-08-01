require 'spec_helper'

describe HomepageController do

  describe "Reverse Auction Home page" do

    it "should have the content 'Reverse Auction Home Page'" do
      visit '/homepage#home'
      expect(page).to have_content('Reverse Auction Home Page')
    end
  end
end
