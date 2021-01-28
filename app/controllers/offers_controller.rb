class OffersController < ApplicationController
    def index
        @offers = Offer.all
    end

    def show
        @offer = Offer.find(params[:id])
        @offers_for_game = Offer.where(game_id: @offer.game.id)
    end

    def new
        @offer = Offer.new
    end

    def create
        @game = Game.find(offer_params[:game_id])
        @offer = Offer.new(
            game: @game,
            user: current_user
        )
        
        if @offer.save
          redirect_to offers_path, notice: 'Offer was successfully created.'
        else
          render :new
        end
    end

    def update
    end
  
    def delete
    end

    private     

    def offer_params
        params.require(:offer).permit(:game_id)
    end
end
