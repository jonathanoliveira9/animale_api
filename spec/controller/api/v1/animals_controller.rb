require 'rails_helper'

RSpec.describe Api::V1::AnimalsController, type: :controller do
  describe 'GET #index' do
    it 'should show animals with status not found' do
      create_list(:animal, 5, :lost)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['data'].all? { |data| data['attributes']['status'].eql?('lost') }).to be_truthy
    end
  end
end
