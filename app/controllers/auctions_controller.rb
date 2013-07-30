class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:auction])
    if @auction.save
      flash[:notice] = "Auction has been initiated."
      redirect_to @auction
    else
      flash[:alert] = "Auction has not been initiated."
      render action: "new"
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update_attributes(params[:auction])
      flash[:notice] = "Auction has been updated."
      redirect_to @auction
    else
      flash[:alert] = "Auction has not been updated."
      render action: "edit"
    end
  end
end
