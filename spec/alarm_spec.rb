require 'spec_helper'

describe Alarm do

  it "mocks a value from the sensor" do
    sensor = double('sensor')
    allow(sensor).to receive(:get_value).and_return(10)

    expect(sensor.get_value).to eq(10)
  end

  it "has a sensor" do
    sensor = Sensor.new
    alarm = Alarm.new(sensor)

    expect(alarm.sensor).to eq(sensor)
  end

  it "receives a sensor value of 10 and alarm is triggered" do
    sensor = double('sensor')
    allow(sensor).to receive(:get_value).and_return(10)
    alarm = Alarm.new(sensor)

    expect(alarm.trigger).to eq("beep beep")
  end

  it "receives a sensor value of 60 and alarm is NOT triggered" do
    sensor = double('sensor')
    allow(sensor).to receive(:get_value).and_return(60)
    alarm = Alarm.new(sensor)

    expect(alarm.trigger).to eq(nil)
  end

end