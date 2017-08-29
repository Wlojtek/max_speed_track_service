class Api::V1::CarPresenter
  def initialize(car:, max_speed_on_track:)
    @car = car
    @max_speed_on_track = max_speed_on_track
  end

  def presentable
    {
      id: @car.id,
      car_slug: @car.slug,
      max_speed: "#{@car.max_speed} km/h",
      max_speed_on_track: @max_speed_on_track
    }
  end

  def as_json(options = {})
    presentable.to_json
  end
end