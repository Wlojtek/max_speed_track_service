require 'rails_helper'

describe Api::V1::SimpleMaxSpeedStrategy do
  let(:car) { build(:car) }
  let(:track) { build(:track) }
  let(:entry) { Api::V1::MaxSpeedStrategyEntry.new(car: car, track: track) }
  let(:expected_max_speed) { car.max_speed - (track.percent_value * car.max_speed) }

  subject { Api::V1::SimpleMaxSpeedStrategy.new.calculate(entry: entry) }

  it { expect(subject).to eq(expected_max_speed)}
end