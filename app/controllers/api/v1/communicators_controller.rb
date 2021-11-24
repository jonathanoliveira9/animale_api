class Api::V1::CommunicatorsController < ApplicationController
  before_action :authenticate_user!

  def create
    animal = Communicator.new(communicator_params)
    if animal.save
      render json: animal, status: :created
    else
      render json: { errors: animal.errors }, status: :unprocessable_entity
    end
  end

  private

  def communicator_params
    params.require(:communicator).permit(:name, :phone, :animal_id)
  end
end
