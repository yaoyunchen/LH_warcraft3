require_relative 'unit'

class Footman < Unit
  attr_accessor :health_points, :attack_power

  def initialize
    @health_points = 60
    @attack_power = 10
  end
end
