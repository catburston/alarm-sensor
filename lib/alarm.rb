require 'sensor'

# Alarm uses Sensor
# to receive a temperature and activate
# itself if this temperature is not in a
# predefined RANGE (50 - 100)

class Alarm
  attr_accessor :sensor
  def initialize(sensor)
    @sensor = sensor
  end

  def trigger
    if @sensor < 50
      "beep beep"
    end
  end

end