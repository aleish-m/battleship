require './lib/player'

class Game

  attr_reader :player_1, :player_2, :start

  def initialize
    @player_1 = Computer.new
    @player_2 = Player.new
    @start = ""
    @player_hit_coordinate = ""
    @computer_hit_coordinate = ""
  end


  def welcome
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    until @start == "p" || @start == "q" do
      print "> "
      @start = gets.chomp.downcase
      next if @start == "p" || @start == "q"
      puts "Please select valid option 'p' or 'q'."
    end
  end


  def setup
    @player_1.place_ship(player_1.cruiser)
    @player_1.place_ship(player_1.submarine)
    puts "I have laid out my ships on the grid."
    puts " "
    puts @player_2.board.render
    ask_for_placement(@player_2.cruiser)
    puts " "
    ask_for_placement(@player_2.submarine)
  end


  def play
    render_boards
    until player_1.dead? || player_2.dead?
      @player_1.board.cells[player_turn].fire_upon
      player_hit_message(@player_hit_coordinate)
      @player_1.dead?

      @player_2.board.cells[comp_turn].fire_upon
      computer_hit_message(@computer_hit_coordinate)
      render_boards
      @player_2.dead?
    end
    results
  end


  def render_boards
    puts ('=' * 10) + "COMPUTER BOARD" + ('=' * 10)
    puts @player_1.board.render
    puts " "
    puts ('=' * 10) + "PLAYER BOARD" + ('=' * 10)
    puts @player_2.board.render(true)
    puts " "
  end


  def results
    if @player_2.dead?
      puts ('=' * 40)
      puts "You Lost. :( \nBetter luck next time."
    else
      puts ('=' * 40)
      puts "You WON!!!"
    end
  end


  def ask_for_placement(boat)
    user_input = []
    puts "Enter the squares for the #{boat.name} (#{boat.length} spaces.) \nSquares must be entered sequentially. Ships can only be Horizontal or Vertical.
      (Example Placement: 'A1 A2' or 'B2 C2 D2')"
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
      coordinate = @player_2.board.cells.keys.shuffle[0]
      if comp_valid_turn?(coordinate)
        break
      end
    end
    puts " "
    @computer_hit_coordinate = coordinate
    coordinate
  end

  def player_valid_turn?(coordinate)
    if @player_1.board.valid_coordinate?(coordinate)
      @player_1.board.cells[coordinate].hit == false
    end
  end

  def player_turn
    coordinate = ""
    puts "Enter the coordinate for your shot:"
    loop do
      print "> "
      coordinate = gets.chomp.upcase
      if player_valid_turn?(coordinate)
        break
      end
      puts "Please enter a valid coordinate you would like to hit"
    end
    puts " "
    @player_hit_coordinate = coordinate
    coordinate
  end

  def player_hit_message(coordinate)
    if @player_1.board.cells[coordinate].render == "X"
      puts "Your shot on #{coordinate} sunk the Computer's #{@player_1.board.cells[coordinate].ship.name}!!!!!!"
    elsif @player_1.board.cells[coordinate].render == "H"
      puts "Your shot on #{coordinate} was a hit"
    elsif @player_1.board.cells[coordinate].render == "M"
      puts "Your shot on #{coordinate} was a miss"
    end
  end

  def computer_hit_message(coordinate)
    if @player_2.board.cells[coordinate].render == "X"
      puts "Computer shot on #{coordinate} sunk your #{@player_2.board.cells[coordinate].ship.name}!!!!!!!"
    elsif @player_2.board.cells[coordinate].render == "H"
      puts "Computer shot on #{coordinate} was a hit"
    elsif @player_2.board.cells[coordinate].render == "M"
      puts "Computer shot on #{coordinate} was a miss"
    end
  end

end
