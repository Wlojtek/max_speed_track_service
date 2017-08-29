require 'rails_helper'

describe Api::V1::MaxSpeedOnTrackService do
  let(:car) { build(:car) }
  let(:track) { build(:track) }
  let(:entry) { Api::V1::MaxSpeedStrategyEntry.new(car: car, track: track) }
  let(:max_speed_strategy) { Api::V1::SimpleMaxSpeedStrategy.new }

  subject { Api::V1::MaxSpeedOnTrackService.new(entry: entry, max_speed_strategy: max_speed_strategy).get }

  it 'call calculate on strategy' do
    expect(max_speed_strategy).to receive(:calculate).with(entry: entry)
    subject
  end
end