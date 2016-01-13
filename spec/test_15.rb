require_relative 'spec_helper'

# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against buildings such as the Barracks. It is however ineffective against other units (can't attack them, as though they were dead).

# So unlike with Footman (whose attacks do a fraction of the damage they normally would), the SiegeEngine does 2x the damage against the Barracks

# Also, Siege Engines can attack other siege engines even though they cannot attack any other units (such as Peasants or Footmen)

# Stats:

# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food
# Notes:

# You will need to require the seige_engine.rb file in spec_helper.rb

describe SiegeEngine do
  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "should be an unit." do
    expect(@siege_engine).to be_an_instance_of(SiegeEngine)
    expect(@siege_engine).to be_a(Unit)
  end

  it "has and knows its health points" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its attack power" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe "#attack!" do
    it "should do double damage to buildings" do
      enemy_building = Barracks.new
      expect(enemy_building).to receive(:damage).with(100)
      @siege_engine.attack_building!(enemy_building)
    end

    it "should not be able to attack footmen" do
      enemy_footman = Footman.new
      expect(@siege_engine.attack!(enemy_footman)).to be_nil
    end

    it "should be able to attack siege engines" do
      enemy_siege_engine = SiegeEngine.new
      @siege_engine.attack!(enemy_siege_engine)
      expect(enemy_siege_engine.health_points).to eq(350)
      #expect(@siege_engine.attack!(enemy_siege_engine)).to be_true
    end

    it "should not be able to attack units if dead" do
      unit = Unit.new(100, 10)
      expect(@siege_engine).to receive(:dead?).and_return true
      expect(@siege_engine.attack!(unit)).to be_nil

      building = Building.new(500)
      expect(@siege_engine).to receive(:dead?).and_return true
      expect(@siege_engine.attack_building!(building)).to be_nil
    end

    it "should not be able to attack dead units." do
      enemy = Unit.new(100, 10)
      expect(enemy).to receive(:dead?).and_return true
      expect(@siege_engine.attack!(enemy)).to be_nil
    end

    it "should not be able to attack destroyed buildings." do
      building = Building.new(500)
      expect(building).to receive(:destroyed?).and_return true
      expect(@siege_engine.attack_building!(building)).to be_nil
    end
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @siege_engine.damage(10)
      expect(@siege_engine.health_points).to eq(390)
    end

  end



end