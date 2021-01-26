class User < ApplicationRecord
  has_many :rentals
  has_many :offers
  has_many :given_reviews, source: :reviews, foreign_key: :reviewer_id
  has_many :received_reviews, source: :reviews, foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
