class Auction < ActiveRecord::Base
  attr_accessible :description, :service

  validates :service, presence: true

  belongs_to :patient

  has_many :bids
  has_many :bids, dependent: :delete_all
end
