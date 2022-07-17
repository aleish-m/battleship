require './lib/ship'

class Cell

  attr_reader :coordinate, :ship, :hit

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @hit = false
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
    if @hit == false && @ship != nil
      @ship.hit
    end
    @hit = true
  end

  def render(show_ship = false)
    if @hit && @ship != nil && @ship.health == 0
      "X"
    elsif @hit && @ship != nil
      "H"
    elsif @hit
      "M"
    elsif show_ship == true && @ship != nil
      "S"
    else
      "."
    end
  end


end
