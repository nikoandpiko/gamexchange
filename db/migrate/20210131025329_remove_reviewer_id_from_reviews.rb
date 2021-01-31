class RemoveReviewerIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :reviewer_id, :bigint
  end
end
