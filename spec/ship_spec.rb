require './lib/ship'
require 'rspec'

describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "the ship exists" do
    expect(@cruiser).to be_instance_of(Ship)
  end
end
