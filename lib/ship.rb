class Ship

  attr_reader :start_coord, :end_coord

  def coordinates(coordinates)
    coordinate_array = coordinates.split
    @start_coord = coordinate_array[0]
    @end_coord = coordinate_array[1]
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
