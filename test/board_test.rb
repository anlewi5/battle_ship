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
    current_board = board.empty_board

    assert_nil board.render_board(current_board)
    # note: should see visible printed board where the test was run
  end

  def test_shot
    current_board = board.empty_board

    assert_nil board.shot("A1", current_board)
  end

  def test_place_shot
    current_board = board.empty_board
    new_board =
      [
        ["A1", "?"], ["A2", " "], ["A3", " "], ["A4", " "],
        ["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "],
        ["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "],
        ["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]
      ]

    assert_equal new_board, board.place_shot("A1", current_board)
  end

  def test_fire_returns_hit_or_miss
    ship_array = ["A1", "A2"]

    assert_equal "H", board.fire("A1", ship_array)
    assert_equal "M", board.fire("B1", ship_array)

  end

  def test_place_ship

  end

  def test_coordinate_already_picked

  end

  def test_ship_off_board

  end

end
