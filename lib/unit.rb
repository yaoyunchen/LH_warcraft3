class Unit
  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def dead?
    health_points <= 0
  end

  def attack!(enemy)
    enemy.damage(@attack_power) unless dead? || enemy.dead?
  end

  def attack_building!(building)
    building.damage((@attack_power/2).to_f.ceil) unless dead? || building.destroyed?
  end

  def damage(damage)
    @health_points -= damage unless dead?
  end
end