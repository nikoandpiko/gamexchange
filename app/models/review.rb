class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true
  validates :reviewer_id, presence: true
end
