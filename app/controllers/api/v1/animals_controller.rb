class Api::V1::AnimalsController < ApplicationController
  def index
    @pagy, @animals = pagy(Animal.where(status: 'lost'))
    render json: AnimalSerializer.new(@animals).serializable_hash
  end
end
