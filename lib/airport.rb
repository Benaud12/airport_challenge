require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :hangar, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather
  end

  def allow_landing?
    return false if full? || weather.stormy?
    true
  end

  def allow_take_off?
    return false if weather.stormy?
    true
  end

  def receive_plane(plane)
    return unless allow_landing?
    plane.land
    hangar << plane
  end

  def release_plane(plane)
    fail 'Plane not at this airport' unless hangar.include?(plane)
    return unless allow_take_off?
    while hangar.last != plane
      hangar.rotate!
    end
    hangar.last.take_off
    hangar.pop
  end

  private

  def full?
    return true if hangar.count == capacity
    false
  end

end
