class BookingsController < ApplicationController

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(pet_id:@pet.id)
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.user = current_user
    @booking.pet = @pet
    authorize @booking
    @booking.accepted = "pending"
    @booking.save ? (redirect_to pet_path(@pet)) : (render :new)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
