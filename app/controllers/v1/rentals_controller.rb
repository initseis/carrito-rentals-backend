class V1::RentalsController < ApplicationController
  before_action :set_rentals, only: %i[index]

  def index
    render json: @rentals
  end

  def destroy
    @rental = @current_user.rentals.find(params[:id])
    response = if @rental.destroy
                 { message: 'Rental destroyed' }
               else
                 { message: "Rental couldn't be deleted" }
               end
    render json: response
  end

  def create
    @rental = @current_user.rentals.new(rental_params)
    response = if @rental.save
                 @rental
               else
                 { message: "Rental couldn't be saved" }
               end
    render json: response
  end

  private

  def set_rentals
    @rentals = @current_user.rentals
  end

  def rental_params
    params.permit(
      :start_date,
      :end_date,
      :city,
      :car_id
    )
  end
end
