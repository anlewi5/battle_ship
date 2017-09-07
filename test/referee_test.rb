require './test/test_helper'
require_relative '../lib/referee'

class RefereeTest < Minitest::Test

  def test_referee_exists
    referee = Referee.new

    assert_instance_of Referee, referee
  end

  def test_referee_takes_user_input

  end

end
