class AuctionsController < ApplicationController
  def index
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
end
