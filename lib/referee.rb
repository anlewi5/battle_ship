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
    place_ship(gets, 2, player_board)
  end

  def three_unit_ship
    puts 'Enter the start and end squares for the three-unit ship:'
    place_ship(gets, 3, player_board)
  end

  def place_ship(user_input, length, board)
    ship = Ship.new
    ship.validate(user_input,length)
    place_ship(ship.start_coord, ship.end_coord, ship.orientation)
  end

  def player_fire
    puts 'What coordinate would you like to fire on?'
    fire_on(gets, computer_board)
  end

  def fire_on(user_input, board)
    board.shot(user_input)
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
    #indicate if sunk
    computer_board.render_board
    if check_game_over(computer_board)
      end_game("player")
    else
      computers_turn
    end
  end

  def computers_turn
    #computer fires
    #puts whether hit or miss
    player_board.render_board
    if check_game_over(player_board)
      end_game("computer")
    else
      players_turn
    end
  end

  def check_game_over(board)
    if board.ship_array == board.hit_array
      true
    else
      run_shot_sequence
    end
  end

  def end_game(winner)
    if winner == "player"
      puts "yay, you win!"
    else
      puts "sorry, computer won"
    end
    #puts number of shots by winner
    #puts total time
  end

end
