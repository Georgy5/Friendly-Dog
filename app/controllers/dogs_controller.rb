class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_dog, only: [:show, :destroy]
  def index
    @dogs = Dog.all
  end

  def show
    @booking = Booking.new

    @user_not_logged = !user_signed_in?
    date_range = []

    @bookings = Booking.where("dog_id = ?", params[:id])

    @bookings.each do |booking|
      date_range << {from: booking.date, to: booking.date}
    end

    @date_json = date_range.to_json
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def find_dog
    @dog = Dog.find(params[:id])
  end


  # strong params - only allow the white list through.
  def dog_params
    params.require(:dog)
      .permit(:name, :breed, :size, :category, :description, :hypoallergenic, :city, :photo)
  end
end
