require './lib/board'

class Computer

  attr_reader :board,
              :cruiser,
              :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def dead?
    @cruiser.health == 0 && @submarine.health == 0
  end

  def place_ship(boat)
    placement = []
    until @board.valid_placement?(boat, placement) == true
      placement = @board.cells.keys.shuffle[0..(boat.length - 1)]
      @board.valid_placement?(boat, placement)
    end
    @board.place(boat, placement)
  end

end
