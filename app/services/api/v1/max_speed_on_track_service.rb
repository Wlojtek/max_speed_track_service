class Api::V1::MaxSpeedOnTrackService
  def initialize(entry:, max_speed_strategy:)
    @entry = entry
    @max_speed_strategy = max_speed_strategy
  end

  def get
    @max_speed_strategy.calculate(@entry)
  end
end