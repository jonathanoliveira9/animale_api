class Api::V1::CommunicatorsController < ApplicationController
  before_action :authenticate_user!

  def create
    communicator = Communicator.new(communicator_params)
    if communicator.save && communicator.animal.communicated!

      render json: communicator, status: :created
    else
      render json: { errors: communicator.errors }, status: :unprocessable_entity
    end
  end

  private

  def communicator_params
    params.require(:communicator).permit(:name, :phone, :animal_id)
  end
end
