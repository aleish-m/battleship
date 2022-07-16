require './lib/player'

class Game

  attr_reader :player_1, :player_2

  def initialize
    @player_1 = Computer.new
    @player_2 = Player.new
  end

  def welcome
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def play
    until player_1.dead? || player_2.dead?
    end
  end

  def player_place_ship(boat, placement)

      coordinates = placement.split(",")

      if coordinates.count == boat.length
        if @player_2.board.valid_placement?(boat, coordinates)
          @player_2.board.place(boat, coordinates)
          true
        else
          false
        end
      else
        false
      end
    # until @player_2.board.valid_placement?(boat, placement) == true
    #   coordinates = placement.split(",")
    #   require "pry"; binding.pry
    #   if coordinates.count == boat.length
    #     @player_2.board.valid_placement?(boat, coordinates)
    #   end
  end

end
