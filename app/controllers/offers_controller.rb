class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?

      @offers = policy_scope(Offer.search_by_title(params[:query]))
      @offer_dup_checker = []
      @indexed_offers = []
      @offers.each do |offer|
        if !@offer_dup_checker.include?([offer.game.title, offer.platform])
          @offer_dup_checker << [offer.game.title, offer.platform]
          @indexed_offers << offer
        end
      end
    else
      @offers = policy_scope(Offer).order(:game_id).page(params[:page])
      @offer_dup_checker = []
      @indexed_offers = []
      @offers.each do |offer|
        if !@offer_dup_checker.include?([offer.game.title, offer.platform])
          @offer_dup_checker << [offer.game.title, offer.platform]
          @indexed_offers << offer
        end
      end
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @offers_for_game = Offer.where(game_id: @offer.game.id)
  end

  def new
    @offer = Offer.new
    @platforms = ["Playstation 4", "Nintendo Switch", "Xbox One"]
    authorize @offer
  end

  def create
    offer_params[:game_id] == "" ? offer_params[:game_id] = nil :

    @game = Game.find(offer_params[:game_id])
    @offer = Offer.new(
      game: @game,
      user: current_user,
      platform: offer_params[:platform]
    )
    authorize @offer

    if @offer.save
      redirect_to user_path(current_user, tab: "mylistedgames"), notice: "Game added to 'My Listed Games'!"
    else
      redirect_to user_path(current_user), notice: "Please choose a platform and a game"
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
    params.require(:offer).permit(:game_id, :platform)
  end
end
