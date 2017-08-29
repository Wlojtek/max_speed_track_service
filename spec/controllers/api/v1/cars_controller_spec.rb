require 'rails_helper'

describe Api::V1::CarsController do
  let(:car) { create(:car) }
  let(:track) { create(:track) }

  describe '#show' do
    subject { get :show, car_slug: car.slug, track: track.name }

    it 'returns success' do
      subject
      expect(response).to be_success
    end

    it 'returns car details' do
      subject
      expect(response.body).to include('car_slug', 'max_speed', 'max_speed_on_track')
    end

    context 'car not found' do
      let(:car) { build(:car) }
      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end