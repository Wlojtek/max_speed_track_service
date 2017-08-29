require 'rails_helper'

describe Api::V1::CarsController do
  let(:car) { create(:car) }
  let(:track) { create(:track) }

  describe '#show' do
    it 'returns cars details' do 
      get :show, car_slug: car.slug, track: track.name
      expect(response.body).to include('car_slug')
    end 
  end
end