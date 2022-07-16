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

end
