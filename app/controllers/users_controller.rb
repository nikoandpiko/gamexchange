class UsersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @user = User.find(params[:id])
    @offer = Offer.find(params[:id])
    @offers_for_game = Offer.where(game_id: @offer.game.id)
  end

end
