require './lib/player'

describe Player do
  before :each do
    @player_1 = Computer.new
    @player_2 = Player.new
  end

  it "Player has computer player that exists" do
    expect(@player_2).to be_instance_of(Player)
  end

  it "Player has a board to play on" do
    expect(@player_2.board).to be_instance_of(Board)
  end

  it "Player has a different board then computer player" do
    expect(@player_1.board).to be_instance_of(Board)
    expect(@player_2.board == @player_1.board).to be(false)
  end

  it "Player is alive at start of game" do
    expect(@player_2.dead?).to be(false)
  end

  it "Player dies if both ships are sunk" do
    @player_2.cruiser.hit
    @player_2.cruiser.hit
    @player_2.cruiser.hit
    expect(@player_2.dead?).to be(false)

    @player_2.submarine.hit
    @player_2.submarine.hit
    expect(@player_2.dead?).to be(true)
  end

end
