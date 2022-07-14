require './lib/cell'

describe Cell do
  before :each do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
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

  it "cell is no longer empty" do
    @cell.place_ship(@cruiser)
    expect(@cell.empty?).to eq(false)
  end

  it "has not been fired upon" do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon?).to eq(false)
  end

  it "has been fired upon" do
    @cell.place_ship(@cruiser)
    expect(@cell.ship.health).to eq(3)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end
  it "renders cells" do
    expect(@cell_1.render).to eq(".")
  end

end
