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
    until start == "p" || start == "q" do
      print "> "
      start = gets.chomp
      puts "Please select valid option 'p' or 'q'."
    end

  end

  def setup
    @player_1.place_ship(player_1.cruiser)
    @player_1.place_ship(player_1.submarine)
    puts "I have laid out my ships on the grid."
    puts @player_2.board.render
    ask_for_placement(@player_2.cruiser)
    puts @player_2.board.render(true)
    ask_for_placement(@player_2.submarine)
    puts @player_2.board.render(true)
  end

  def play
    puts ('=' * 10) + "COMPUTER BOARD" + ('=' * 10)
    puts @player_1.board.render
    puts " "
    puts ('=' * 10) + "PLAYER BOARD" + ('=' * 10)
    puts @player_2.board.render(true)

    until player_1.dead? || player_2.dead?

      @player_1.board.cells[player_turn].fire_upon
      puts ('=' * 10) + "COMPUTER BOARD" + ('=' * 10)
      puts @player_1.board.render
      puts " "
      puts ('=' * 10) + "PLAYER BOARD" + ('=' * 10)
      puts @player_2.board.render(true)
      @player_1.dead?

      @player_2.board.cells[comp_turn].fire_upon
      puts ('=' * 10) + "COMPUTER BOARD" + ('=' * 10)
      puts @player_1.board.render
      puts " "
      puts ('=' * 10) + "PLAYER BOARD" + ('=' * 10)
      puts @player_2.board.render(true)
      @player_2.dead?
    end
      if @player_2.dead?
        puts ('=' * 40)
        puts "You lost"
      else
        puts ('=' * 40)
        puts "You WON!!!"
      end
  end


  def ask_for_placement(boat)
    user_input = []
    puts "Enter the squares for the #{boat.name} (#{boat.length} spaces.)
    Squares must be entered sequentially. Ships can only be Horizontal or Vertical.
    (Example Input: 'A1 A2 A3' or 'B2 C2 D2')"
    until @player_2.board.valid_placement?(boat, user_input) do
      print "> "
      user_input = gets.chomp.upcase.split(" ")
      next if @player_2.board.valid_placement?(boat, user_input)
      puts "Those are invalid coordinates. Please try again:"
    end
    @player_2.board.place(boat, user_input)
  end


  def comp_valid_turn?(coordinate)
    @player_2.board.cells[coordinate].hit == false
  end

  def comp_turn
    coordinate = " "
    loop do
      coordinate = @player_1.board.cells.keys.shuffle[0]
      if comp_valid_turn?(coordinate)
        break
      end
    end
    puts "Computer shot #{coordinate}"
    coordinate
  end

  def player_valid_turn?(coordinate)
    if @player_2.board.valid_coordinate?(coordinate)
      @player_1.board.cells[coordinate].hit == false
    else
      puts "Please enter a valid coordinate you would like to hit"
    end
  end

  def player_turn
    coordinate = ""
    loop do
      puts "Please enter a valid coordinate you would like to hit"
      print "> "
      coordinate = gets.chomp.upcase
      if player_valid_turn?(coordinate)
        break
      end
    end
    puts "You shot #{coordinate}"
    coordinate
  end

end
