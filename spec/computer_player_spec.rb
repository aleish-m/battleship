require './lib/computer_player.rb'

describe Computer do
  before :each do
    @player_1 = Computer.new
  end

  it "has computer player that exists" do
    expect(@player_1).to be_instance_of(Computer)
  end

  it "has a board to play on" do
    expect(@player_1.board).to be_instance_of(Board)
  end

  it "Computer player is alive at start of game" do
    expect(@player_1.dead?).to be(false)
  end

  it "Computer player dies if both ships are sunk" do
    @player_1.cruiser.hit
    @player_1.cruiser.hit
    @player_1.cruiser.hit
    expect(@player_1.dead?).to be(false)

    @player_1.submarine.hit
    @player_1.submarine.hit
    expect(@player_1.dead?).to be(true)
  end

  it "Computer can provide valid ship placement" do
    expect(@player_1.place_ship(@player_1.cruiser)).to be_a_kind_of(Array)
    expect(@player_1.board.cells).to have_key(@player_1.place_ship(@player_1.cruiser)[0])
    expect(@player_1.board.cells).to have_key(@player_1.place_ship(@player_1.cruiser)[1])
    expect(@player_1.board.cells).to have_key(@player_1.place_ship(@player_1.cruiser)[2])
  end


end
