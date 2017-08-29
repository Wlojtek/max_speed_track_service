require 'rails_helper'

describe Api::V1::CarPresenter do
  let(:car) { build(:car) }
  let(:max_speed_on_track) { 100 }

  subject { Api::V1::CarPresenter.new(car: car, max_speed_on_track: max_speed_on_track).presentable }

  it '#presentable' do 
    expect(subject).to include(
      id: car.id,
      car_slug: car.slug,
      max_speed: "#{car.max_speed} km/h",
      max_speed_on_track: max_speed_on_track
    )
  end
end