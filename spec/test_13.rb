require_relative 'spec_helper'

# A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already dead.

describe "#attack!" do 

  before :each do
    #@unit = Unit.new(100, 10)
    @unit = Footman.new
  end

  it "should not be able to attack units if dead." do
    enemy = Unit.new(100, 10)
    expect(@unit).to receive(:dead?).and_return true
    expect(@unit.attack!(enemy)).to be_nil
  end

  it "should not be able to attack dead units." do
    enemy = Unit.new(100, 10)
    expect(enemy).to receive(:dead?).and_return true
    expect(@unit.attack!(enemy)).to be_nil
  end
end