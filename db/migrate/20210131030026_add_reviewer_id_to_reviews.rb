class AddReviewerIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :reviewer_id, :bigint
  end
end
