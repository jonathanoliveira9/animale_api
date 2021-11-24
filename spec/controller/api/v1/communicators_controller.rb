require 'rails_helper'
require_relative '../../../support/api_helper'

RSpec.describe Api::V1::CommunicatorsController, type: :controller do
  describe 'POST #create' do
    include ApiHelper
    let(:user) { create(:user) }
    let(:animal) { create(:animal, user_id: user.id) }
    let(:attributes) { attributes_for(:communicator).merge({ animal_id: animal }) }

    before do
      authenticated_header(request, user)
    end

    it 'should create communicators' do
      post :create, params: { communicator: attributes }, format: :json
      expect(response).to have_http_status(:created)
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
end
