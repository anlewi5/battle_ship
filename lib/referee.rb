require './lib/board'
require './lib/ship'

class Referee

  def welcome
    puts 'Welcome to BATTLESHIP'
  end

  def initial_questions
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    check_user_input(gets)
  end

  def check_user_input(user_input)
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

  def computer_setup
    #tell computer to place ships
    puts 'I have laid out my ships on the grid.
          You now need to layout your two ships.
          The first is two units long and the
          second is three units long.
          The grid has A1 at the top left and D4 at the bottom right.'
  end

  def two_unit_ship
    puts 'Enter the squares for the two-unit ship:'
    place_ship(gets)
  end

  def three_unit_ship
    puts 'Enter the start and end squares for the three-unit ship:'
    place_ship(gets)
  end

  def place_ship(user_input)

  end

  def player_fire
    puts 'What coordinate would you like to fire on?'
    fire_on(gets)
  end

  def fire_on(user_input)

  end

  def enter_promt
    puts 'press enter to complete turn'
  end

end
