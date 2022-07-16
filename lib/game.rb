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
    coordinates = placement.split(", ")

    if coordinates.count == boat.length
      if @player_2.board.valid_placement?(boat, coordinates) == true
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

  def ask_for_placement(boat)
    user_input = []
    puts "Enter the squares for the #{boat.name} (#{boat.length} spaces.)"
    until @player_2.board.valid_placement?(boat, user_input) do
      print "> "
      user_input = gets.chomp.split(" ")
      next if @player_2.board.valid_placement?(boat, user_input)
      puts "Those are invalid coordinates. Please try again:"
    end
    @player_2.board.place(boat, user_input)
  end

end
