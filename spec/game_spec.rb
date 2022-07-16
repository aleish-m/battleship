require './lib/game'

describe Game do
  before :each do
    @game = Game.new
  end

it "has a game that exists" do
  expect(@game).to be_instance_of(Game)
end

end
