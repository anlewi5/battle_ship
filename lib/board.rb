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
    return h_or_m
  end

  def ship_array

  end

end
