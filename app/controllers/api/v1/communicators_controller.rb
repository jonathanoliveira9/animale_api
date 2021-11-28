class Api::V1::CommunicatorsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    communicators = Communicator.by_animal(params[:animal_id])
    render json: CommunicatorSerializer.new(communicators).serializable_hash, status: :ok
  end

  def create
    communicator = Communicator.new(communicator_params)
    if communicator.save && communicator.animal.communicated!
      render json: CommunicatorSerializer.new(communicator).serializable_hash, status: :created
    else
      render json: { errors: communicator.errors }, status: :unprocessable_entity
    end
  end

  private

  def communicator_params
    params.require(:communicator).permit(:name, :phone, :occurrence, :animal_id)
  end
end
