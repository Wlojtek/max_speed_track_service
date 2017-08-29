class Api::V1::SimpleMaxSpeedStrategy < Api::V1::MaxSpeedStrategy
  def calculate(entry:)
    entry.max_speed - (entry.slowing_factor * entry.max_speed)
  end
end