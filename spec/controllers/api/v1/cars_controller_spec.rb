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

    context 'when no track selected' do
      subject { get :show, car_slug: car.slug }

      it 'returns correct message' do
        subject
        expect(response.body).to eq('No track selected')
      end
    end

    context 'when track not exists' do
      let(:fake_track) { 'fake_track' }

      subject { get :show, car_slug: car.slug, track: fake_track }

      it 'returns correct message' do
        subject
        expect(response.body).to eq('Track not found')
      end
    end
  end
end