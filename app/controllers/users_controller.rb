class UsersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @offers_for_user = Offer.where(user_id: @user.id)
  end





  private

    def offer_params
      params.require(:user).permit(:user_id)
    end
end
