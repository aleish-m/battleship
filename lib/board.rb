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


  def valid_placement?(boat, coordinates)
    if coordinates.count == boat.length
        row = coordinates.map do |coordinate|
          coordinate[0]
        end

        num_row = row.map do |letter|
          letter.ord
        end

        column = coordinates.map do |coordinate|
          coordinate[1].to_i
        end

        overlap = coordinates.map do |coordinate|
          cells[coordinate].empty?
        end

      if !overlap.include?(false)

        if row.uniq.count == 1 &&
            column.each_cons(2).all? do |num_1, num_2|
              num_2 == num_1 +1
            end
            true

        elsif column.uniq.count == 1 &&
            num_row.each_cons(2).all? do |num_1, num_2|
              num_2 == num_1 +1
            end
              true
        else
          false
        end

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



end
