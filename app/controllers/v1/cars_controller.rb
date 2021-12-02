class V1::CarsController < ApplicationController
  before_action :all_cars, only: %i[index]
  before_action :set_car, only: %i[show]
  # before_action :car_params

  def index
    render json: @cars
  end

  def show
    render json: @car
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    response = if @car.destroy
                 { message: 'Car destroyed' }
               else
                 { message: "Car didn't delete" }
               end
    render json: response
  end

  def create
    p car_params
    # user = current_user
    car = Car.new(car_params)
    # car.owner = user
    response = if car.save
                 { car: car }
               else
                 { message: "Car didn't save" }
               end
    render json: response
  end

  private

  def all_cars
    @cars = Car.all
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.permit(
      :brand,
      :model,
      :seats_number,
      :transmision,
      :mileage,
      :image,
      :price_for_day,
      :bags_number
    )
  end
end
