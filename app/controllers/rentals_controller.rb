class RentalsController < ApplicationController
  before_action :find_rental, only: [:show, :update]
  before_action :find_offer, except: [:update]

  def index
    @rentals = Rental.all
  end

  def show; end

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(
      offer: @offer,
      user: current_user
    )
    authorize @rental
    if @rental.save
      redirect_to user_path(current_user), notice: "Game added to 'My Rentals'!"
    else
      render :new, notice: 'Try again'
    end
  end

  def update
    authorize @rental
    @rental.update(rental_params)
    redirect_to user_path(current_user), notice: "You have successfully returned the game!"
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def rental_params
    params.require(:rental).permit(:status)
  end
end
