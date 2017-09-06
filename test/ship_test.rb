require './test/test_helper'
require_relative '../lib/ship'

class ShipTest < Minitest::Test

  attr_reader :ship

  def setup
    @ship = Ship.new
  end

  def test_ship_exists
    assert_instance_of Ship, ship
  end

  def test_coordinates_sets_start_and_end_coordinates
    ship.coordinates("A1 B1")

    assert_equal "A1", ship.start_coord
    assert_equal "B1", ship.end_coord
  end

  def test_check_horizontal_ship_length
    horizontal_ship = Ship.new
    horizontal_ship.coordinates("A1 A2")
    error_output = "ship is invalid: incorrect ship length"
    invalid_input = horizontal_ship.check_horizontal_ship_length(3)

    assert_equal error_output, invalid_input
  end

  def test_horizontal_ship
    horizontal_ship = Ship.new
    horizontal_ship.coordinates("A1 A2")
    error_output = "ship is invalid: incorrect ship length"
    invalid_input = horizontal_ship.horizontal_ship(3)

    assert_equal error_output, invalid_input
  end

  def test_check_vertical_ship_length
    vertical_ship = Ship.new
    vertical_ship.coordinates("A1 B1")
    error_output = "ship is invalid: incorrect ship length"
    invalid_input = vertical_ship.check_vertical_ship_length(3)

    assert_equal error_output, invalid_input
  end

  def test_vertical_ship
    horizontal_ship = Ship.new
    horizontal_ship.coordinates("A1 A2")
    error_output = "ship is invalid: incorrect ship length"
    invalid_input = horizontal_ship.vertical_ship(3)

    assert_equal error_output, invalid_input
  end

  def test_ship_orientation
    vertical_ship = Ship.new
    vertical_ship.coordinates("A1 B1")
    horizontal_ship = Ship.new
    horizontal_ship.coordinates("A1 A2")
    diagonal_ship = Ship.new
    diagonal_ship.coordinates("A1 B2")
    error_output = "ship is invalid: incorrect ship length"
    diagonal_error = "ship is invalid: cannot place diagonal"

    assert_equal error_output, vertical_ship.ship_orientation(3)
    assert_equal error_output, horizontal_ship.ship_orientation(3)
    assert_equal diagonal_error, diagonal_ship.ship_orientation(3)
  end

end
