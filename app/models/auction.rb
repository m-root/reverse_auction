class Auction < ActiveRecord::Base
  attr_accessible :description, :service

  validates :service, presence: true

  belongs_to :patients

  has_many :bids
  has_many :bids, dependent: :delete_all
end
