require 'rails_helper'
require_relative '../../../support/api_helper'

RSpec.describe Api::V1::AnimalsController, type: :controller do
  include ApiHelper
  let(:user) { create(:user) }

  before do
    authenticated_header(request, user)
  end

  describe 'GET #index' do
    it 'should show animals with status not found' do
      create_list(:animal, 5, :lost)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['data'].all? { |data| data['attributes']['status'].eql?('lost') }).to be_truthy
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:attributes) { attributes_for(:animal).merge(user_id: user.id) }
    it 'should create animal' do
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:created)
    end

    it 'should forbid create animal' do
      attributes.delete(:name)
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:forbidden)
    end

    it 'should forbid grade animal without user' do
      attributes.delete(:user_id)
      post :create, params: { animal: attributes }, format: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'PUT #update' do
    let(:animal) { create(:animal) }
    it 'should update animal' do
      patch :update, params: { id: animal.id, animal: { name: Faker::JapaneseMedia::OnePiece.character } }, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'should forbid update grade without current_user' do
      patch :update, params: { id: animal.id, animal: { user_id: nil } }, format: :json
      expect(response).to have_http_status(:forbidden)
    end
  end
end
