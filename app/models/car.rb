class Car < ApplicationRecord
  has_many :rentals, dependent: :destroy
  validates :brand, :model, :seats_number, :transmision, :mileage, :image, :price_for_day, :bags_number, presence: true
  validates :seats_number, :bags_number, numericality: { only_integer: true, greater_than: 0 }
  validates :price_for_day, numericality: { only_float: true, greater_than: 0 }
  belongs_to :user
end
