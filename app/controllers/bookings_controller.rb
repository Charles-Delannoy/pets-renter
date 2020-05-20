class BookingsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.user = current_user
    @booking.pet = @pet
    @booking.accepted = "pending"
    @booking.save ? (redirect_to pet_path(@pet)) : (render :new)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
