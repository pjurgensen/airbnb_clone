class Rental < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :reservations
  has_many :reservations
end
