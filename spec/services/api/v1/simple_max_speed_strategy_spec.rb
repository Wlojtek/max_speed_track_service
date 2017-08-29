require 'rails_helper'

describe Api::V1::SimpleMaxSpeedStrategy do
  let(:car) { build(:car) }
  let(:track) { build(:track) }
  let(:entry) { Api::V1::MaxSpeedStrategyEntry.new(car: car, track: track) }
  let(:expected_max_speed_on_trac) { car.max_speed - (track.percent_value * car.max_speed) }

  subject { Api::V1::SimpleMaxSpeedStrategy.new.calculate(entry: entry) }

  it 'calculate correctly max speed on track' do
    expect(subject).to eq(expected_max_speed_on_trac)
  end
end