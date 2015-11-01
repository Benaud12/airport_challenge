require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar, :weather

  def initialize(capacity=DEFAULT_CAPACITY, weather = Weather)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def receive(plane)
    return 'Unable to accept landing request' unless allow_landing?
    plane.land
    hangar << plane
  end

  def release(plane)
    fail 'Plane not at this airport' unless hangar.include?(plane)
    return 'Unable to release plane' unless allow_take_off?
    while hangar.last != plane
      hangar.rotate!
    end
    hangar.last.take_off
    hangar.pop
  end

  def allow_landing?
    return false if full? || stormy_weather?
    true
  end

  def allow_take_off?
    return false if stormy_weather?
    true
  end

  private

  def stormy_weather?
    weather.stormy?
  end

  def full?
    return true if hangar.count == capacity
    false
  end

end
