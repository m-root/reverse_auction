class AuctionsController < ApplicationController
  def index

  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:project])
    if @auction.save
      flash[:notice] = "Auction has been initiated."
      redirect_to @auction
    else
      # nothing, yet
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end
end
