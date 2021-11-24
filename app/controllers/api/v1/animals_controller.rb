class Api::V1::AnimalsController < ApplicationController
  include Paginable

  def index
    @pagy, @animals = pagy(Animal.where(status: 'lost'), items: per_page, page: current_page)
    options = get_links_serializer_options('api_v1_animals_path', @pagy)
    render json: AnimalSerializer.new(@animals, options).serializable_hash
  end
end
