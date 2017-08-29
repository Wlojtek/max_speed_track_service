class Track < ActiveRecord::Base
  enum surface_type: %i[snow gravel asphalt]

  SURFACE_TO_VALUE = {
    snow: 0.35,
    gravel: 0.12,
    asphalt: 0.05
  }

  def percent_value
    SURFACE_TO_VALUE[surface_type.to_sym]
  end
end
