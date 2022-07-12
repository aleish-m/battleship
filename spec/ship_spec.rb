require './lib/ship'
require 'rspec'

describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "the ship exists" do
    expect(@cruiser).to be_instance_of(Ship)
  end

  it "has a name" do
    expect(@cruiser.name).to eq("Cruiser")
  end

  it "has a length" do
    expect(@cruiser.length).to eq(3)
  end

  it "can have a different length" do
    cruiser = Ship.new("Cruiser", 2)
    expect(cruiser.health).to eq(2)
  end

  it "has health" do
    expect(@cruiser.health).to eq(3)
  end

  it "can have different health" do
    cruiser = Ship.new("Cruiser", 10)
    expect(cruiser.health).to eq(10)
  end

  it "is not sunk" do
    expect(@cruiser.sunk?).to eq(false)
  end

  it "can be hit and lose health" do

    expect(@cruiser.health).to eq(3)
    @cruiser.hit
    expect(@cruiser.health).to eq(2)

  end

end
