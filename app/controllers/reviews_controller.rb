class ReviewsController < ApplicationController
  before_action :find_user, only: [:new]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @owner = User.find(params[:user_id])
    # @review.user_id = (params[:user_id])
    @review.user = @owner
    @review.reviewer = current_user
    authorize @review

    if @review.save
      # Marks rental as "Returned" after review has been created
      @rental = Rental.find(params[:rental_id])
      @rental.status = "Returned"
      @rental.save
      redirect_to user_path(current_user), notice: 'Review added!'
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :reviewer_id)
    # params.require(:review).permit(:rating, :content, :reviewer_id, :user_id)
  end
end
