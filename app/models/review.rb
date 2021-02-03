class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewer, class_name: "User"
  validates :content, presence: true
  validates :rating, presence: true
  validates :reviewer_id, presence: true
end
