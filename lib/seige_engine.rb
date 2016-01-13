require_relative 'unit'

class SiegeEngine < Unit
  attr_accessor :attack_power, :health_points
  
  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
    (enemy.damage(@attack_power) if enemy.class == SiegeEngine)unless dead? || enemy.dead?

    
  end

  def attack_building!(enemy_building)
    enemy_building.damage(2 * @attack_power) unless dead? ||enemy_building.destroyed?
  end
end