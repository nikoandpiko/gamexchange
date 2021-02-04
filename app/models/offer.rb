class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :rentals
  validates :platform, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
  associated_against: {
  game: [:title]},
  using: {
    tsearch: { prefix: true }
  }
end
