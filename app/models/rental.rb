class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :status, presence: true
  # validates :status, inclusion: { in: [true, false] } when change to boolean
end
