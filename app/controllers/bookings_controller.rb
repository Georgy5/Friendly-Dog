class BookingsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = current_user
    # Note - the following line is a quick and dirty fix
    @booking.status = "approved"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @bookings = current_user.bookings.reverse
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :user_id, :dog_id)
  end
end
