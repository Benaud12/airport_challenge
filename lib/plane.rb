class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def land
    fail "Already landed" unless flying
    @flying = false
  end

  def take_off
    fail "Already flying" if flying
    @flying = true
  end

  def flying?
    flying
  end

end



