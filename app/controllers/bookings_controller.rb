require 'date'

class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :refuse]

  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    @booked = Booking.joins(:pet).where(pets: {user: current_user}).order(created_at: :desc)
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
    @booking.save ? (redirect_to bookings_path(@pet)) : (render :new)
    flash[:notice] = "You have successfully booked a pet"
  end

  def accept
    @booking.accept
    save_booking
  end

  def refuse
    @booking.refuse
    save_booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def save_booking
    @booking.save ? (redirect_to bookings_path) : (render :new)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :id, :accepted)
  end
end
