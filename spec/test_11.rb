require_relative 'spec_helper'

# In most strategy games, like Warcraft III, buildings can also be attacked by units. Since a barracks is a building, it has substantial more HP (500) To make matters worse, a Footman does only HALF of its AP as damage to a Barracks. This is because they are quite ineffective against buildings.

# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "should be a Building." do
    expect(@barracks).to be_an_instance_of(Barracks)
    expect(@barracks).to be_a(Building)
  end

  it "has and knows its health points" do
    expect(@barracks.health_points).to eql(500)
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @barracks.damage(10)
      expect(@barracks.health_points).to eq(490)
    end

    it "should take half damage from enemy footmen." do
      enemy = Footman.new
      #expect(@barracks).to receive(:damage).with(5)
      enemy.attack_building!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  end
end

