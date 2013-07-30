class Auction < ActiveRecord::Base
  attr_accessible :description, :service

  validates :service, :presence => true

  has_many :bids
end
