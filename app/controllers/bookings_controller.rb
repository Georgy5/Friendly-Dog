class BookingsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    if @booking.save
      # TODO - Fix redirect after submitting a new booking
      # redirect_to booking_new_path(@dog)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :user_id, :dog_id)
  end
end
