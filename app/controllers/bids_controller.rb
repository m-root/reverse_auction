class BidsController < ApplicationController
before_filter :authenticate_doctor!, except: [:index, :show, :update]
before_filter :find_auction
before_filter :find_bid, only: [:show, :edit, :update, :destroy]

  def new
    @bid = @auction.bids.build
  end

  def create
    @bid = @auction.bids.build(params[:bid])
    @bid.doctor = current_doctor
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

  def edit
  end

  def update
    if @bid.update_attributes(params[:bid])
      flash[:notice] = "Bid has been updated."
      redirect_to [@auction, @bid]
    else
      flash[:alert] = "Bid has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @bid.destroy
    flash[:notice] = "Bid has been deleted."
    redirect_to @auction
  end

private
  def find_auction
    @auction = Auction.find(params[:auction_id])
  end

  def find_bid
    @bid = @auction.bids.find(params[:id])
  end
end
