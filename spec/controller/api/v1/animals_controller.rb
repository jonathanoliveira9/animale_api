require 'rails_helper'

RSpec.describe Api::V1::AnimalsController, type: :controller do
  describe 'GET #index' do
    it 'should show animals not found' do
      get :index, format: :json
    end
  end
end
