class RentalsController < ApplicationController
  before_action :find_rental, only: [:show, :update]
  before_action :find_offer

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
      user: current_user,
      status: :status
    )
    authorize @rental
    if @rental.save
      redirect_to offers_path(@rental.offer), notice: 'Rental was successfully created.'
    else
      render :new, notice: 'Try again'
    end
  end

  def update
    @rental.update(rental_params)
    redirect_to offers_path(@rental.offer), notice: 'Rental status has been updated'
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def rental_params
    params.require(:rental).permit(:status, :offer, :user)
  end
end
