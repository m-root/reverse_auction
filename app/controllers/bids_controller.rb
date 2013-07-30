class BidsController < ApplicationController
before_filter :find_auction
before_filter :find_bid, only: [:show, :edit, :update, :destroy]

  def new
    @bid = @auction.bids.build
  end

  def create
    @bid = @auction.bids.build(params[:bid])
    if @bid.save
      flash[:notice] = "Bid has been created."
      redirect_to [@auction, @bid]
    else
      flash[:alert] = "Bid has not been created."
      render action: "new"
    end
  end

  def show
  end

private
  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

  def find_bid
    @bid = @auction.bids.find(params[:id])
  end
end
