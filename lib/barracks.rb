require_relative 'footman'
require_relative 'peasant'

class Barracks

  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
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
