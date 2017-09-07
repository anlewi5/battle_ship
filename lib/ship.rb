class Ship

  attr_reader :coordinate_array,
              :start_coord,
              :end_coord,
              :orientation,
              :valid

  def initialize
    @valid = false
  end

  def coordinates(coordinates)
    puts "at coordinates"
    @coordinate_array = coordinates.split
    @start_coord = coordinate_array[0]
    @end_coord = coordinate_array[1]
  end

  def ship_orientation(ship_length)
    puts "at ship_orientation"
    puts "#{start_coord[1]}"
    puts "#{end_coord[1]}"
    if start_coord[0] == end_coord[0]
      @orientation = "horizontal"
      horizontal_ship(ship_length)
    elsif start_coord[1] == end_coord[1]
      @orientation = "vertical"
      vertical_ship(ship_length)
    else
      "ship is invalid: cannot place diagonal"
    end
  end

  def horizontal_ship(ship_length)
    puts "horizontal_ship"
    check_horizontal_ship_length(ship_length)
  end

  def check_horizontal_ship_length(ship_length)
    puts "check_horizontal_ship_length"
    if (start_coord[1].to_i - end_coord[1].to_i).abs != ship_length - 1
      "ship is invalid: incorrect ship length"
    else
      @valid = true
    end
  end

  def vertical_ship(ship_length)
    check_vertical_ship_length(ship_length)
  end

  def check_vertical_ship_length(ship_length)
    if (start_coord[0].ord - end_coord[0].ord).abs != ship_length - 1
      "ship is invalid: incorrect ship length"
    else
      @valid = true
    end
  end

  def validate(coordinates, length)
    coordinates(coordinates)
    ship_orientation(length)
  end

end
