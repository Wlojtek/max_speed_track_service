require 'rails_helper'

describe Api::V1::CarsController do
  describe '#show' do
    it 'returns cars details' do 
      get :show, car_slug: :subar_impreza
      expect(response.body).to include('car_slug')
    end 
  end
end