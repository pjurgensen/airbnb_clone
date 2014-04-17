class User < ActiveRecord::Base
  has_many :rentals
  has_many :rentals, through: :reservations
  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :registerable, :confirmable, :lockable

  validates :username, presence: true
end
