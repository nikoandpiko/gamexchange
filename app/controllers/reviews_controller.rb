class ReviewsController < ApplicationController
  before_action :find_user, only: [ :new ]

   def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.user_id = (params[:user_id])
    @review.reviewer_id = current_user.username
    authorize @review

    if @review.save
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
