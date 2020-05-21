class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pet, only: [:edit, :show, :update, :destroy]


  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR pet_type ILIKE :query OR address ILIKE :query"
      @pets = policy_scope(Pet).where(sql_query, query: "%#{params[:query]}%").geocoded
    else
      @pets = policy_scope(Pet).geocoded
    end

    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
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
    params.require(:pet).permit(:name, :description, :birthdate, :pet_type, :race, :photo, :address, :price)
  end
end
