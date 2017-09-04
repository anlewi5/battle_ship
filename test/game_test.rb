require './test/test_helper'
require_relative '../lib/game'

class GameTest

  attr_reader :game

  def setup
    @game = Game.new
  end

  def test_game_class_exists
    assert_instance_of Game, game
  end

end
