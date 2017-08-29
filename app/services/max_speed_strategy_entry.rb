class MaxSpeedStrategyEntry
  def initialize(car:, track:)
    @car = car
    @track = track
  end

  def max_speed
    @car.max_speed
  end

  def slowing_factor
    @track.percent_value
  end
end