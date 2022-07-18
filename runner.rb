require './lib/game.rb'

def start
  game = Game.new
  game.welcome
  game.setup
  game.play
end

start
