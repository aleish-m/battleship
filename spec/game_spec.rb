require './lib/game'

describe Game do
  before :each do
    @game = Game.new
  end

  it "has a game that exists" do
    expect(@game).to be_instance_of(Game)
  end

  it "check player_2 has valid placement" do
    # expect(@game.ask_for_placement(@game.player_2.cruiser).to be(true)
    # expect(@game.player_place_ship(@game.player_2.cruiser)).to be_a_kind_of(Array)
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[0])
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[1])
    # expect(@game.player_2.board.cells).to have_key(@game.player_place_ship(@game.player_2.cruiser)[2])
  end

  it "Game provides end game results if player Loses" do
    @game.player_2.cruiser.hit
    @game.player_2.cruiser.hit
    @game.player_2.cruiser.hit
    @game.player_2.submarine.hit
    @game.player_2.submarine.hit
    expect(@game.player_2.dead?).to be(true)
    expect(@game.results).to eq("You Lost. :( \nBetter luck next time.")
  end

  it "Game provides end game results if player Wins" do
    @game.player_1.cruiser.hit
    @game.player_1.cruiser.hit
    @game.player_1.cruiser.hit
    @game.player_1.submarine.hit
    @game.player_1.submarine.hit
    expect(@game.player_1.dead?).to be(true)
    expect(@game.results).to eq("You WON!!!")
  end

end
