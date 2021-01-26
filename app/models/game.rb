class Game < ApplicationRecord
  has_many :offers
  validates :title, uniqueness: true, presence: true
end
