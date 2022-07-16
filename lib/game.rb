require './lib/player'

class Game

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




end
