class Board

  def empty_board
    [
      ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
      ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
      ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
      ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
    ]
    render_board
  end

  def render_board
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

  def shot(coordinate)
    if coordinate != " "
      "this location has already been fired upon, please choose another coordinate"
    else

    end
  end

  def ship

  end

end
