require './lib/player'

class Game

  attr_reader :player_1, :player_2

  def initialize
    @player_1 = Computer.new
    @player_2 = Player.new
  end

  def welcome
    start = ""
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    until start == "p" || start =="q" do
      print "> "
      start = gets.chomp
      puts "Please select valid option 'p' or 'q'."
    end

    if start = "p"
      @player_1.place_ship(player_1.cruiser)
      @player_1.place_ship(player_1.submarine)
      puts "I have laid out my ships on the grid."
      @player_2.board.render
      ask_for_placement(@player_2.cruiser)
      @player_2.board.render(true)
      ask_for_placement(@player_2.submarine)
      @player_2.board.render(true)
    else
      puts "Goodbye!!"
    end
  end

  def play
    until player_1.dead? || player_2.dead?
    end
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
