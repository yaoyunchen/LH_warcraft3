require_relative 'building'
require_relative 'footman'
require_relative 'peasant'

class Barracks < Building

  attr_accessor :health_points, :gold, :food, :lumber  

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  def can_train_footman?
    gold >=135 && food >= 2 ? true : false
  end

  def train_footman
    @gold -= 135
    @food -= 2
    footman = Footman.new if can_train_footman?
  end

  def can_train_peasant?
    gold >= 90 && food >= 5 ? true : false
  end

  def train_peasant
    @gold -= 90
    @food -= 5
    peasant = Peasant.new if can_train_peasant?
  end
end
