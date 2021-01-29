class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    #TODO
    @dog = Dog.new
  end

  def create
    @dog = dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  private

  #TODO
  def set_dog
  end

  # strong params - only allow the white list through.
  def dog_params
    params.require(:dog)
      .permit(:name, :breed, :size, :category, :description, :hypoallergenic, :city)
  end
end
