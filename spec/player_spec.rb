require './lib/player'

describe Player do
  before :each do
    @player_1 = Computer.new
    @player_2 = Player.new
  end

  it "has computer player that exists" do
    expect(@player_2).to be_instance_of(Player)
  end

  it "has a board to play on" do
    expect(@player_2.board).to be_instance_of(Board)
  end

  it "has a differnt board then computer player" do
    expect(@player_1.board).to be_instance_of(Board)
    expect(@player_2.board == @player_1.board).to be(false)
  end

end
