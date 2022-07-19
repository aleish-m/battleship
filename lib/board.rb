require './lib/cell'

class Board

  attr_reader :cells
  def initialize
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")}

  end

  def valid_coordinate?(cell)
    @cells.has_key?(cell)
  end

  def overlap(coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def row(coordinates)
    coordinates.map do |coordinate|
      coordinate[0]
    end
  end

  def num_row(coordinates)
    row(coordinates).map do |letter|
      letter.ord
    end
  end

  def column(coordinates)
    coordinates.map do |coordinate|
      coordinate[1].to_i
    end
  end

  def valid_placement?(boat, coordinates)

    if coordinates.count == boat.length && overlap(coordinates).all?

      if row(coordinates).uniq.count == 1 &&
        column(coordinates).each_cons(2).all? do |num_1, num_2|
          num_2 == num_1 +1
        end
        true

      elsif column(coordinates).uniq.count == 1 &&
        num_row(coordinates).each_cons(2).all? do |num_1, num_2|
          num_2 == num_1 +1
        end
        true

      else
        false
      end

    else
      false
    end

  end


  def place(boat,coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(boat)
    end
  end

  def render(show = false)
    "  1 2 3 4 \n" +
    "A #{@cells.fetch_values("A1", "A2", "A3", "A4").map {|cell| cell.render(show)}.join(" ")} \n" +
    "B #{@cells.fetch_values("B1", "B2", "B3", "B4").map {|cell| cell.render(show)}.join(" ")} \n" +
    "C #{@cells.fetch_values("C1", "C2", "C3", "C4").map {|cell| cell.render(show)}.join(" ")} \n" +
    "D #{@cells.fetch_values("D1", "D2", "D3", "D4").map {|cell| cell.render(show)}.join(" ")} \n"

  end

end
