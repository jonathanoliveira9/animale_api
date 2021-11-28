require 'rails_helper'
require_relative '../../../support/api_helper'

RSpec.describe Api::V1::CommunicatorsController, type: :controller do
  include ApiHelper
  let(:user) { create(:user) }
  let(:animal) { create(:animal, user_id: user.id) }
  let(:attributes) { attributes_for(:communicator).merge({ animal_id: animal }) }

  describe 'POST #create' do
    it 'should create communicators' do
      post :create, params: { communicator: attributes }, format: :json
      expect(response).to have_http_status(:created)
    end

    it 'should the animal change to communicated' do
      post :create, params: { communicator: attributes }, format: :json
      expect(animal.reload.status).to eq('communicated')
    end

    it 'should not create communicators without name' do
      attributes.delete(:name)
      post :create, params: { communicator: attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should not create communicators without resource animal' do
      attributes.delete(:animal_id)
      post :create, params: { communicator: attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #index' do
    it 'should get communicators by animal' do
      authenticated_header(request, user)

      create_list(:communicator, 5, animal_id: animal.id)
      get :index, params: { animal_id: animal.id }, format: :json
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(animal.communicators.first.name).to eq(json_response.dig(:data, 0, :attributes, :name))
    end

    it 'should not permit without login' do
      create_list(:communicator, 5, animal_id: animal.id)
      get :index, params: { animal_id: animal.id }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
