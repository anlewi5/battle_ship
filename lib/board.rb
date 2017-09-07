class Board

  attr_accessor :board,
                :ship_array,
                :hit_array,
                :shot_count

  def initialize
    @board = empty_board
    @ship_array = []
    @hit_array = []
    @shot_count = 0
  end

  def empty_board
    [
      ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
      ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
      ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
      ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
    ]
  end

  def render_board
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

  def shot(coordinate)
    if coordinate != " "
      "this location has already been fired upon, please choose another coordinate"
    else
      place_shot(coordinate)
    end
  end

    def place_shot(coordinate)
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
      ship_array.flatten.each do |ship_spot|
        if coordinate == ship_spot
          h_or_m = 'H'
          break
        else
          h_or_m = 'M'
        end
      end
      @shot_count +=1
      puts h_or_m
      h_or_m
    end

  def place_ship(start_coord, end_coord, orientation, ship_array =[])
    if orientation == "horizontal"
      letter = start_coord[0]
      start_num = start_coord[1]
      end_num = end_coord[1]
      ship = (start_num..end_num).to_a
      ship.map! do |num|
        letter + num
      end
      ship_array << ship
    elsif orientation == "vertical"
      number = start_coord[1]
      start_letter = start_coord[0]
      end_letter = end_coord[0]
      ship = (start_letter..end_letter).to_a
      ship.map! do |alpha|
        alpha + number
      end
      ship_array << ship
    end
    ship_array
  end

    def coordinate_already_picked(coordinate, ship_array)
      if ship_array.flatten.any? {|spot| coordinate == spot}
        "ship is invalid: ships cannot overlap"
      end
    end

    def ship_off_board(coordinate, ship_array)
      if empty_board.none? {|spot| coordinate == spot[0]}
        "ship is invalid: please choose a spot on the board"
      end
    end

  def hits
    board.each {|spot| @hit_array << spot[0] if spot[1] == "H"}
    @hit_array
  end

  def sunk
    sunk = []
    hits
    @ship_array.each do |ship|
      if ship.all? {|ship_coord| @hit_array.include? ship_coord}
        sunk << ship
      end
    end
    "you've sunk ship(s) #{sunk}!"
  end

end
