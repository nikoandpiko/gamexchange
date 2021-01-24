class Game < ApplicationRecord
    validates :title, uniqueness: true
end
