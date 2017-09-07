require './lib/board'
require './lib/ship'
require './lib/instructions'

class Referee

  attr_reader :player_board, :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
  end

  def welcome
    puts 'Welcome to BATTLESHIP'
  end

  def initial_questions
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    check_user_input(gets.chomp)
  end

  def check_user_input(user_input)
    play if user_input == ('p' || 'play')
    instructions if user_input == ('i' || 'read the instructions')
    quit if user_input == ('q' or 'quit')
  end

  def play
    computer_setup
  end

  def instructions
    print_instructions
    initial_questions
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

  def run_setup
    welcome
    initial_questions
    two_unit_ship
    three_unit_ship
  end

  def run_shot_sequence
    players_turn
    computers_turn
  end

  def players_turn
    computer_board.render_board
    player_fire
    #indicate whether hit or miss (and if sunk)
    computer_board.render_board
    check_game_over
    enter_promt
  end

  def computers_turn
    #computer shot sequence:
    #computer fires
    #puts whether hit or miss
    player_board.render_board
    check_game_over
    #return to player shot sequence
  end

  def check_game_over(board)
    if #ship array coord all have matches in hits array
      end_game
    else
      run_shot_sequence
    end
  end

  def end_game
    #puts sorry or congratulations
    #puts number of shots by winner
    #puts total time
  end

end
