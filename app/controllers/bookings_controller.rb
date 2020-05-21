class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
    @booked = Booking.joins(:pet).where(pets: {user: current_user})
    # @booked = Booking.where(pets: {user: current_user})
    policy_scope(@bookings)
  end

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
    flash[:notice] = "You have successfully booked a pet"
    @booking.save ? (redirect_to pet_path(@pet)) : (render :new)
  end

  def update
    @booking = Booking.find(booking_params[:id])
    @booking.accepted = booking_params[:accepted]
    @booking.save ? (redirect_to bookings_path) : (render :new)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :id, :accepted)
  end
end
