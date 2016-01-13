class Building

  attr_reader :health_points
  def initialize(health_points)
    @health_points = health_points
  end

  def damage(damage)
    @health_points -= damage
  end

  def destroyed?
    health_points <= 0
  end
end