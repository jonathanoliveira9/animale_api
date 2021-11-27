class Api::V1::AnimalsController < ApplicationController
  include Paginable
  before_action :authenticate_user!, only: %i[create update]
  before_action :find_animal, only: [:update]

  def index
    @pagy, @animals = pagy(Animal.where(status: 'lost'), items: per_page, page: current_page)
    options = get_links_serializer_options('api_v1_animals_path', @pagy)
    render json: AnimalSerializer.new(@animals, options).serializable_hash
  end

  def create
    animal = Animal.new(animal_params)
    animal.user_id = current_user.id
    if animal.save
      render json: animal, status: :created
    else
      render json: { errors: animal.errors.full_messages.join(', ') }, status: :forbidden
    end
  end

  def update
    if @animal.update(animal_params)
      render json: @animal
    else
      render json: @animal.errors, status: :forbidden
    end
  end

  private

  def find_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :age, :extra_information, :status)
  end
end
