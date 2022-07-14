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
  end

end
