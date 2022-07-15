require './lib/board'

describe Board do
  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it "board exists" do
    expect(@board).to be_instance_of(Board)
  end

  it "has cells as a hash" do
    expect(@board.cells).to be_a_kind_of(Hash)
    expect(@board.cells["A1"]).to be_instance_of(Cell)
    expect(@board.cells.count).to be(16)
  end

  it "has valid coordinates" do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
  end

  it "checks for invalid coordinates" do
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it "has the right number of coordinates" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
  end

  it "has consecutive coordinates" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
  end

  it "cant have diagonal coordinates" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)
  end

  it "has valid coordinates" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be(true)
    expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to be(true)
    expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to be(true)
  end

  it "can place ships on board" do
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

  @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(cell_1.ship).to eq(@cruiser)
    expect(cell_2.ship).to eq(@cruiser)
    expect(cell_3.ship).to eq(@cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
end

  it "ships do not overlap when placed" do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["A4", "B4"])).to be(true)
  end

end
