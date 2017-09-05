class Board

  def empty_board
    [
      ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
      ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
      ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
      ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
    ]
  end

  def render_board(board)
    puts ". 1 2 3 4"
    puts "A #{board[0..3].map {|spot| spot[1]}.join}"
    puts "B #{board[4..7].map {|spot| spot[1]}.join}"
    puts "C #{board[8..11].map {|spot| spot[1]}.join}"
    puts "D #{board[12..15].map {|spot| spot[1]}.join}"
  end

  def print_row(row)
    spot = ""
    row.each {|space| spot = spot + space[1]}
    spot
  end

  #need elsif coordinate not on board
  def shot(coordinate, board)
    if coordinate != " "
      "this location has already been fired upon, please choose another coordinate"
    else
      board = place_shot(coordinate, board)
    end
    render_board(board)
  end

    def place_shot(coordinate, board)
      board.map do |space|
        if coordinate == space[0]
          [coordinate, fire(space[0])]
        else
          space
        end
      end
    end

    #ship_array default just for testing
    def fire(coordinate, ship_array = [])
      h_or_m = '?'
      ship_array.each do |ship_spot|
        if coordinate == ship_spot
          h_or_m = 'H'
          break
        else
          h_or_m = 'M'
        end
      end
      h_or_m
    end

  def place_ship(start_coord, end_coord, ship_array =[])
    #check coordinate validity
    ship_array << start_coord
    ship_array << end_coord
    ship_array
  end

    def coordinate_already_picked(coordinate, ship_array)
      if ship_array.any? {|spot| coordinate == spot}
        "ship is invalid: ships cannot overlap"
      end
    end

    def ship_off_board(coordinate, ship_array)
      if empty_board.none? {|spot| coordinate == spot[0]}
        "ship is invalid: please choose a spot on the board"
      end
    end

    def ship_orientation(start_coord, end_coord, ship_length)
      if start_coord.last == end_coord.last
        horizontal_ship(start_coord, end_coord, ship_length)
      elsif start_coord.first == end_coord.first
        vertical_ship(start_coord, end_coord, ship_length)
      else
        "ship is invalid: cannot place diagonal"
      end
    end

      def horizontal_ship(start_coord, end_coord, ship_length)
        check_horizontal_ship_length(start_coord, end_coord, ship_length)
      end

        def check_horizontal_ship_length(start_coord, end_coord, ship_length)
          if abs(start_coord.first.ord - end_coord.first.ord) != ship_length - 1
            "ship is invalid: incorrect ship length"
          end
        end

      def vertical_ship(start_coord, end_coord, ship_length)
        check_vertical_ship_length(start_coord, end_coord, ship_length)
      end

        def check_vertical_ship_length(start_coord, end_coord, ship_length)
          if abs(start_coord.last - end_coord.last) != ship_length - 1
            "ship is invalid: incorrect ship length"
          end
        end

end
