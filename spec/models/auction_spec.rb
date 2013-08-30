require 'spec_helper'

  describe Auction do
    it "should create a new instance given valid attributes" do
    Factory(:auction)
  end

  describe "description" do
    it "should be required" do
    blank = Factory.build(:auction, :description => "")
    # blank.should_not be_valid
    # blank.errors[:description].should include("can't be blank")

    blank.description = "Foo"
    # blank.should be_valid
    end

    it "should be longer than 1 character" do
    too_short = Factory.build(:auction, :description => 'a')
    # too_short.should_not be_valid
    # too_short.errors[:description].should include("is too short (minimum is 2 characters)")

    too_short.description = 'aa'
    # too_short.should be_valid
    end

    it "should be shorter than 101 characters" do
    too_long = Factory.build(:auction, :description => 'a' * 101)
    # too_long.should_not be_valid
    # too_long.errors[:description].should include("is too long (maximum is 100 characters)")

    # too_long.password = 'a' * 100
    # too_long.should be_valid
    end
  end
end
