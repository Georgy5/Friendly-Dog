class BookingController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @dog = dog.find(params[:dog_id])
    @booking.dog = @dog
    if @booking.save
      redirect_to booking_new_path(@dog)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status, :user_id, :dog_id)
  end
end
