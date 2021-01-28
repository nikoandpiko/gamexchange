class UsersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @offers_for_user = Offer.where(user_id: @user.id)
  end

end
