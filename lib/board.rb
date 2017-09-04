class Board

  def empty_board
    [
      ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
      ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
      ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
      ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
    ]
  end

#doesn't render new hits
  def render_board(board)
    puts ". 1 2 3 4"
    puts "A"
    puts "B"
    puts "C"
    puts "D"
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
      place_shot(coordinate, board)
    end
  end

  def place_shot(coordinate, board)
    board.map do |space|
      if coordinate == space[0]
        space[1] == fire(space[0])
      end
    end
  end

  def fire(coordinate)
    ship_array.each do |ship_spot|
      if coordinate == ship_spot
        ship = 'H'
        break
      else
        ship = 'M'
      end
    end
    return ship
  end

  def ship_array

  end

end
