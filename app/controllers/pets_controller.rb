class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :show, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.save ? (redirect_to pets_path) : (render :new)
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end


  def pet_params
    params.require(:pet).permit(:name, :description, :birthdate, :pet_type, :race, :photo)
  end
end
