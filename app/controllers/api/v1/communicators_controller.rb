class Api::V1::CommunicatorsController < ApplicationController
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
