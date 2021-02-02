class UsersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @rentals = @user.rentals
    @offers_for_user = @user.offers
    @review = Review.new
  end

  private

    def offer_params
      params.require(:user).permit(:user_id)
    end
end
