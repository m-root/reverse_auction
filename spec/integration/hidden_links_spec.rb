require 'spec_helper'

feature "hidden links" do
  let!(:auction) { Factory(:auction) }
  let!(:patient) { Factory(:confirmed_patient) }
  let!(:doctor) { Factory(:confirmed_doctor) }

  context "patients" do
  before { sign_in_as!(type: "patient", user: patient) }
    scenario "cannot see the New Bid link" do
      visit '/'
      click_link auction.service
      assert_no_link_for "New Bid"
    end

    scenario "cannot see the Edit Bid link" do
      visit '/'
      click_link auction.service
      assert_no_link_for "Edit Bid"
    end

    scenario "cannot see the Delete Bid link" do
      visit '/'
      click_link auction.service
      assert_no_link_for "Delete Bid"
    end
  end

  context "doctors" do
  before { sign_in_as!(type: "doctor", user: doctor) }
    scenario "cannot see the Service Request link" do
      visit '/'
      assert_no_link_for "Service Request"
    end

    scenario "cannot see the Edit Auction link" do
      visit '/'
      click_link auction.service
      assert_no_link_for "Edit Auction"
    end

    scenario "cannot see the Delete Auction link" do
      visit '/'
      click_link auction.service
      assert_no_link_for "Delete Auction"
    end
  end
end
