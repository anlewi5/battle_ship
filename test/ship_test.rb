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

  def test_ship_orientation
    skip
    vertical_ship = "A1 B1"
    horizontal_ship = "A1 A2"
  end

  def test_horizontal_ship

  end

  def test_check_horizontal_ship_length

  end

  def test_vertical_ship

  end

  def test_check_vertical_ship_length

  end

end
