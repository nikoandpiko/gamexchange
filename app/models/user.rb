class User < ApplicationRecord
  has_many :offers
  has_many :rentals
  has_many :rentals_as_owner, through: :offers, source: :rentals
  has_many :reviews, dependent: :destroy
  has_many :given_reviews, source: :reviews, foreign_key: :reviewer_id
  has_many :received_reviews, source: :reviews, foreign_key: :user_id
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]
  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # def username
  #   return self.email.split('@')[0].capitalize
  # end
end
