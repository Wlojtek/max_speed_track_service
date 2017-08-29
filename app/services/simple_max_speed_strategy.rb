class SimpleMaxSpeedStrategy < MaxSpeedStrategy
  def calculate(entry)
    entry.max_speed - (entry.slowing_factor * entry.max_speed)
  end
end