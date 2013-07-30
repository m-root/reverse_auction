class AuctionsController < ApplicationController
before_filter :find_project, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @auction.update_attributes(params[:auction])
      flash[:notice] = "Auction has been updated."
      redirect_to @auction
    else
      flash[:alert] = "Auction has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @auction.destroy
    flash[:notice] = "Auction has been deleted."
    redirect_to auctions_path
  end

private
  def find_project
    @auction = Auction.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The service request you were looking for could not be found."
    redirect_to auctions_path
  end
end
