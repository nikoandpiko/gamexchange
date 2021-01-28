class Game < ApplicationRecord
  has_many :offers, dependent: :destroy
  validates :title, uniqueness: true, presence: true
end
