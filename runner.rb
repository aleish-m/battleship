require './lib/game.rb'

def start
loop do
  game = Game.new
      game.welcome
      if game.start == "p"
        game.setup
        game.play
        puts " "
        puts "-" * 40
        puts " "
      else
        puts "Goodbye."
        break
      end
    end
end

start
