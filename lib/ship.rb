class Ship

  attr_reader :start_coord, :end_coord

  def coordinates(coordinates)
    coordinate_array = coordinates.split
    @start_coord = coordinate_array[0]
    @end_coord = coordinate_array[1]
  end

  def ship_orientation(ship_length)
    if start_coord[1] == end_coord[1]
      horizontal_ship(ship_length)
    elsif start_coord[0] == end_coord[0]
      vertical_ship(ship_length)
    else
      "ship is invalid: cannot place diagonal"
    end
  end

    def horizontal_ship(ship_length)
      check_horizontal_ship_length(ship_length)
    end

      def check_horizontal_ship_length(ship_length)
        if (start_coord[0].ord - end_coord[0].ord).abs != ship_length - 1
          "ship is invalid: incorrect ship length"
        end
      end

    def vertical_ship(ship_length)
      check_vertical_ship_length(ship_length)
    end

      def check_vertical_ship_length(ship_length)
        if (start_coord[1].ord - end_coord[1].ord).abs != ship_length - 1
          "ship is invalid: incorrect ship length"
        end
      end

end
