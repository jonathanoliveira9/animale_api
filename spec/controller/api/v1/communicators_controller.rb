require 'rails_helper'

RSpec.describe Api::V1::CommunicatorsController, type: :controller do
  describe 'POST #create' do
    it 'should create communicators' do
      post :create, params: { communicator: attributes_for(:communicator) }, format: :json
    end
  end
end
