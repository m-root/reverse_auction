require 'spec_helper'

  describe Bid do
    it "should create a new instance given valid attributes" do
    Factory(:bid)
  end

  describe "additional_offers" do
    it "should be required" do
    blank = Factory.build(:bid, :additional_offers => "")
    # blank.should_not be_valid
    # blank.errors[:additional_offers].should include("can't be blank")

    blank.additional_offers = "Foo"
    # blank.should be_valid
    end

    it "should be longer than 1 character" do
    too_short = Factory.build(:bid, :additional_offers => 'a')
    # too_short.should_not be_valid
    # too_short.errors[:additional_offers].should include("is too short (minimum is 2 characters)")

    too_short.additional_offers = 'aa'
    # too_short.should be_valid
    end

    it "should be shorter than 101 characters" do
    too_long = Factory.build(:bid, :additional_offers => 'a' * 101)
    # too_long.should_not be_valid
    # too_long.errors[:additional_offers].should include("is too long (maximum is 100 characters)")

    # too_long.password = 'a' * 100
    # too_long.should be_valid
    end
  end
end
