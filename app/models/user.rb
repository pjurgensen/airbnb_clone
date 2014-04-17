class User < ActiveRecord::Base
  has_many :rentals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :registerable, :confirmable, :lockable

  validates :username, presence: true
end
