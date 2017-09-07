require './lib/referee'
require './lib/board'

referee = Referee.new
player_board = Board.new
computer_board = Board.new

referee.welcome
referee.initial_questions
referee.computer_setup
referee.two_unit_ship
referee.three_unit_ship

#player shot sequence:
computer_board.render_board
referee.player_fire
#indicate whether hit or miss (and if sunk)
computer_board.render_board
referee.enter_promt

#computer shot sequence:
#computer fires
#puts whether hit or miss
puts player_board.render_board
#return to player shot sequence

#end game sequence:
#puts sorry or congratulations
#puts number of shots by winner
#puts total time
