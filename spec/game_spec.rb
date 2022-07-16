require './lib/game'

describe Game do
  before :each do
    @game = Game.new
  end

  it "has a game that exists" do
    expect(@game).to be_instance_of(Game)
  end

  it "has a welcome message" do
    expect(@game.welcome).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
  end

  it "check player_2 has valid placement" do
    placement = "A1, A2, A3"
    expect(@game.player_place_ship(@game.player_2.cruiser, placement)).to be(true)
    # expect(@game.player_place_ship(@game.player_2.cruiser)).to be_a_kind_of(Array)
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[0])
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[1])
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[2])
  end

end
