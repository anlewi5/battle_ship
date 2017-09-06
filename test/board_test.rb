require './test/test_helper'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  attr_reader :board

  def setup
    @board = Board.new
  end

  def test_board_class_exists
    assert_instance_of Board, board
  end

  def test_prints_single_row
    a = [["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "]]

    assert_equal "    ", board.print_row(a)
  end

  def test_empty_board
    empty_board =
      [
        ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
        ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
        ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
        ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
      ]

    assert_equal empty_board, board.empty_board
  end

  def test_render_board
    assert_nil board.render_board
    # note: should see visible printed board where the test was run
  end

  def test_shot
    assert_nil board.shot("A1")
  end

  def test_place_shot
    new_board =
      [
        ["A1", "?"], ["A2", " "], ["A3", " "], ["A4", " "],
        ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
        ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
        ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
      ]

    assert_equal new_board, board.place_shot("A1")
  end

  def test_fire_returns_hit_or_miss
    ship_array = [["A1", "A2"]]

    assert_equal "H", board.fire("A1", ship_array)
    assert_equal "M", board.fire("B1", ship_array)

  end

  def test_place_ship
    coordinate_array = ["A1", "A2"]

    assert_equal [["A1", "A2"]], board.place_ship(coordinate_array)
  end

  def test_coordinate_already_picked
    ship_array = [["A1", "A2"]]
    coordinate = "A1"
    overlap_error = "ship is invalid: ships cannot overlap"

    assert_equal overlap_error, board.coordinate_already_picked(coordinate, ship_array)
  end

  def test_ship_off_board
    ship_array = [["A1", "A2"]]
    coordinate = "A5"
    off_board_error = "ship is invalid: please choose a spot on the board"

    assert_equal off_board_error, board.ship_off_board(coordinate, ship_array)
  end

  def test_hit_array
    board.board =
      [
        ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
        ["B1", "H"], ["B2", "H"], ["B3", " "], ["B4", " "],
        ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
        ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
      ]

    assert_equal ["B1", "B2"], board.hits
  end

  def test_sunk
    board.board =
      [
        ["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "],
        ["B1", "H"], ["B2", "H"], ["B3", " "], ["B4", " "],
        ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
        ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
      ]
    board.ship_array = [['B1', 'B2']]

    assert_equal "you've sunk ship(s) [[\"B1\", \"B2\"]]!", board.sunk
  end

end
