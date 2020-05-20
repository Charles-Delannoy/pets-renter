class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pet, only: [:edit, :show, :update, :destroy]


  def index
    @pets = policy_scope(Pet)
    @petsgeocoded = policy_scope(Pet).geocoded

    @markers = @petsgeocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end

  def show
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = current_user
    @pet.save ? (redirect_to pets_path) : (render :new)
  end

  def edit
    authorize @pet
  end

  def update
    authorize @pet
    @pet.update(pet_params)
    @pet.save ? (redirect_to pet_path(@pet)) : (render :new)
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end


  def pet_params
    params.require(:pet).permit(:name, :description, :birthdate, :pet_type, :race, :photo, :address)
  end
end
