class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :status, presence: true
  STATUSES = ['Accepted', 'Declined', 'Pending', 'Returned', 'Archived', 'Request']
end
