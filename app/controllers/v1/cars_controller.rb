class V1::CarsController < ApplicationController
  before_action :all_cars, only: %i[index]
  before_action :set_car, only: %i[show]

  def index
    render json: @cars
  end

  def show
    render json: @car
  end

  def destroy
    @car = @current_user.cars.find(params[:id])
    response = if @car.destroy
                 { message: 'Car destroyed' }
               else
                 { message: "Car didn't delete" }
               end
    render json: response
  end

  def create
    @car = @current_user.cars.new(car_params)
    if @car.save
      render json: @car, status: 201
    else
      render json: { message: "Car couldn't be saved" }, status: 422
    end
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
