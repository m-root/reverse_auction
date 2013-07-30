require 'spec_helper'

describe AuctionsController do
  it "displays an error for a missing service request" do
    get :show, id: "not-here"
    response.should redirect_to(auctions_path)
    message = "The service request you were looking for could not be found."
    flash[:alert].should == message
  end
end
