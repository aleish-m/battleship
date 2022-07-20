require './lib/computer_player'

class Player

  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def dead?
    @cruiser.health == 0 && @submarine.health == 0
  end

end
