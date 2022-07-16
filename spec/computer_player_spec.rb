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

end
