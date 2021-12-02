class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, :user_id, :car_id, :city, presence: true
end
