class BookingController < ApplicationController
  def new
    @dog = Dog.find(params[:cocktail_id])
    @booking = Booking.new
  end

  def create
  end
end
