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

  def test_can_render_empty_board
    assert_nil board.empty_board
    #note: should see visible printed board
  end


end
