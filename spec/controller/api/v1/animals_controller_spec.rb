require 'rails_helper'
require_relative '../../../support/api_helper'

RSpec.describe Api::V1::AnimalsController, type: :controller do
  include ApiHelper
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'should show animals with status not found' do
      authenticated_header(request, user)
      create_list(:animal, 5, :lost)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['data'].all? { |data| data['attributes']['status'].eql?('lost') }).to be_truthy
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:attributes) { attributes_for(:animal) }
    it 'should create animal' do
      authenticated_header(request, user)
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:created)
    end

    it 'should forbid create animal' do
      authenticated_header(request, user)
      attributes.delete(:name)
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it 'should forbid animal without current_user' do
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    let(:animal) { create(:animal) }
    it 'should update animal' do
      authenticated_header(request, user)
      patch :update, params: { id: animal.id, animal: { name: Faker::JapaneseMedia::OnePiece.character } }, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'should forbid update animal without current_user' do
      patch :update, params: { id: animal.id, animal: { name: Faker::JapaneseMedia::OnePiece.character } }, format: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
