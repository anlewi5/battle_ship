require './lib/referee'
require './lib/board'

referee = Referee.new
player_board = Board.new
computer_board = Board.new

referee.run_setup
referee.run_shot_sequence
referee.run_end_game

#end game sequence:
#puts sorry or congratulations
#puts number of shots by winner
#puts total time
