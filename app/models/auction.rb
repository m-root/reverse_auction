class Auction < ActiveRecord::Base
  attr_accessible :description, :service

  validates :service, presence: true

  has_many :bids, dependent: :delete_all
end
