class Api::V1::CarPresenter
  def initialize(car:, max_speed_on_track:)
    @car = car
    @max_speed_on_track = max_speed_on_track
  end

  def presentable
    {
      id: @car.id,
      car_slug: @car.slug,
      max_speed: max_speed_in_km_per_hour(@car.max_speed),
      max_speed_on_track: @max_speed_on_track
    }
  end

  def as_json(options = {})
    presentable.to_json
  end

  private 

  def max_speed_in_km_per_hour(value)
    "#{value} km/h"
  end
end