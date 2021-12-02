class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  has_many :cars, dependent: :destroy
  validates :username, uniqueness: true, length: { minimum: 6 }
end
