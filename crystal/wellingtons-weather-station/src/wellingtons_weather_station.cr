class Temperature
  def to_kelvin(celsius : Float | Int) : Float
    celsius.to_f + 273.15
  end

  def round(celsius)
    celsius.round 1
  end

  def to_fahrenheit(celsius)
    converted = (celsius * 1.8) + 32
    converted.to_i
  end

  def number_missing_sensors(number_of_sensors)
    (4 - number_of_sensors) % 4
  end
end
