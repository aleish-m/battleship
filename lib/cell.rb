require './lib/ship'

class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
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
    @ship.hit
  end

end
