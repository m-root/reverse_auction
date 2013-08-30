require 'spec_helper'

  describe Doctor do
    it "should create a new instance given valid attributes" do
    Factory(:doctor)
  end

  describe "password" do
    it "should be required" do
    blank = Factory.build(:doctor, :password => "")
    blank.should_not be_valid
    # blank.errors[:password].should include("can't be blank")

    blank.password = "Foo"
    # blank.should be_valid
    end

    it "should be longer than 1 character" do
    too_short = Factory.build(:doctor, :password => 'a')
    too_short.should_not be_valid
    # too_short.errors[:password].should include("is too short (minimum is 2 characters)")

    too_short.password = 'aa'
    # too_short.should be_valid
    end

    it "should be shorter than 101 characters" do
    too_long = Factory.build(:doctor, :password => 'a' * 101)
    too_long.should_not be_valid
    # too_long.errors[:password].should include("is too long (maximum is 100 characters)")

    too_long.password = 'a' * 100
    # too_long.should be_valid
    end
  end
end
