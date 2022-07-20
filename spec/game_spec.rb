require './lib/game'

describe Game do
  before :each do
    @game = Game.new
  end

  it "has a game that exists" do
    expect(@game).to be_instance_of(Game)
  end

  it "game checks player_2 has valid turn" do
    expect(@game.player_valid_turn?("A1")).to eq(true)
    @game.player_1.board.cells["A1"].fire_upon
    expect(@game.player_valid_turn?("A1")).to eq(false)
    expect(@game.player_valid_turn?("A5")).to eq(false)
  end

  it "game checks player_1 has valid turn" do
    expect(@game.comp_valid_turn?("A1")).to eq(true)
    @game.player_2.board.cells["A1"].fire_upon
    expect(@game.comp_valid_turn?("A1")).to eq(false)
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

  it "has player hit feedback" do
    @game.player_1.board.place(@game.player_1.cruiser,["A1", "A2", "A3"])
    @game.player_1.board.cells["A1"].fire_upon
    expect(@game.player_hit_message("A1")).to eq("Your shot on A1 was a hit")
    @game.player_1.board.cells["A2"].fire_upon
    @game.player_1.board.cells["A3"].fire_upon
    expect(@game.player_hit_message("A3")).to eq("Your shot on A3 sunk the Computer's Cruiser!!!!!!")
    @game.player_1.board.cells["B2"].fire_upon
    expect(@game.player_hit_message("B2")).to eq("Your shot on B2 was a miss")
  end

  it "has computer hit feedback" do
    @game.player_2.board.place(@game.player_2.cruiser,["A1", "A2", "A3"])
    @game.player_2.board.cells["A1"].fire_upon
    expect(@game.computer_hit_message("A1")).to eq("Computer shot on A1 was a hit")
    @game.player_2.board.cells["A2"].fire_upon
    @game.player_2.board.cells["A3"].fire_upon
    expect(@game.computer_hit_message("A3")).to eq("Computer shot on A3 sunk your Cruiser!!!!!!!")
    @game.player_2.board.cells["B2"].fire_upon
    expect(@game.computer_hit_message("B2")).to eq("Computer shot on B2 was a miss")

  end

end
