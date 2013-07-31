class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :doctor
  attr_accessible :additional_offers, :lowest_bid, :maximum_bid

  validates :maximum_bid, presence: true, numericality: { greater_than: 0 }
  validates :lowest_bid, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
