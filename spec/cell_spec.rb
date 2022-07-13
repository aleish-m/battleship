require './lib/cell'

describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "cell exists" do
    expect(@cell).to be_instance_of(Cell)
  end

  it "has a coordinate" do
    expect(@cell.coordinate).to eq("B4")
  end

  it "it doesnt have a ship" do

    expect(@cell.ship).to eq(nil)
  end

  it "is cell empty?" do

    expect(@cell.empty?).to eq(true)
  end

  it "can place a ship" do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
  end

end
