require 'spec_helper'

  describe Patient do
    it "should create a new instance given valid attributes" do
    Factory(:patient)
  end

  describe "password" do
    it "should be required" do
    blank = Factory.build(:patient, :password => "")
    blank.should_not be_valid
    # blank.errors[:password].should include("can't be blank")

    blank.password = "Foo"
    # blank.should be_valid
    end

    it "should be longer than 1 character" do
    too_short = Factory.build(:patient, :password => 'a')
    too_short.should_not be_valid
    # too_short.errors[:password].should include("is too short (minimum is 2 characters)")

    too_short.password = 'aa'
    # too_short.should be_valid
    end

    it "should be shorter than 101 characters" do
    too_long = Factory.build(:patient, :email => 'a' * 101)
    too_long.should_not be_valid
    # too_long.errors[:email].should include("is too long (maximum is 100 characters)")

    too_long.email = 'a' * 100
    # too_long.should be_valid
    end
  end
end
