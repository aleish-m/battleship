require './lib/ship'

class Cell

  attr_reader :coordinate, :ship, :render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @render = "."
  end

  def empty?
    ship == nil
  end

  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @ship.health < @ship.length
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    else
      @render = "M"
    end
  end

end
