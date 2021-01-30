class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @offers_for_game = Offer.where(game_id: @offer.game.id)
  end

  def new
      @offer = Offer.new
      authorize @offer
  end

    def create
        @game = Game.find(offer_params[:game_id])
        @offer = Offer.new(
            game: @game,
            user: current_user
        )
        authorize @offer

        if @offer.save
          redirect_to user_path(current_user), notice: "Game added to 'My Listed Games'!"
        else
          render :new
        end
    end

  def update
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy

    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:game_id)
  end
end
