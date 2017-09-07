require './lib/board'
require './lib/ship'

class Referee

  attr_reader :user_input

  def get_user_input(user_input)
    @user_input = user_input
  end

  def check_user_input
    play if user_input == 'p' || 'play'
    instruction if user_input == 'i' || 'read the instructions'
    quit if user_input == 'q' or 'quit'
  end

  def play
    #promt to enter ship layout
  end

  def instructions
    #print instructions
  end

  def quit
    #exit game
  end

  def place_ship
    
  end

end
