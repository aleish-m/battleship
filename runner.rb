require './lib/game.rb'

def start
  game = Game.new
  game.setup
  game.play
end

start
