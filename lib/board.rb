require './lib/cell'

class Board

  attr_reader :cells
  def initialize
    @cells = {"A1" => Cell.new("A1"),
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
        # Create a row arry that contains the first character of all the coordinates
        # Create a second array that is a column array that contains the second character of all the coordinates
        #It is a valid if:
        #the row array is all the same (eg: all A, all B or all C)
        #and the column array is sequntial

        #or the Column array is all the same (ie: 111 or 222)
        #and the row array is all sequntial (ABC)
          row = coordinates.map do |coordinate|
            coordinate[0]
          end
          num_row = row.map do |letter|
            letter.codepoints
          end.flatten
          column = coordinates.map do |coordinate|
            coordinate[1].to_i
          end

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
  end





end
