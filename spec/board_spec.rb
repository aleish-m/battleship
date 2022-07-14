require './lib/board'

describe Board do
  before :each do
    @board = Board.new
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
  end

  
end
