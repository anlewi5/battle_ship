require './lib/referee'
require './lib/board'

referee = Referee.new
player_board = Board.new
computer_board = Board.new

puts 'Welcome to BATTLESHIP'

puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
user_input = gets
referee.get_user_input(user_input)

puts 'I have laid out my ships on the grid.
      You now need to layout your two ships.
      The first is two units long and the
      second is three units long.
      The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:'
user_input = gets
referee.place_ship(user_input)

puts 'Enter the start and end squares for the three-unit ship:'
user_input = gets
referee.place_ship(user_input)

#player shot sequence:
puts computer_board.render_board
puts 'What coordinate would you like to fire on?'
user_input = gets
referee.fire_on(user_input)
#indicate whether hit or miss (and if sunk)
puts computer_board.render_board
puts 'press enter to complete turn'

#computer shot sequence:
#computer fires
#puts whether hit or miss
puts player_board.render_board
#return to player shot sequence

#end game sequence:
#puts sorry or congratulations
#puts number of shots by winner
#puts total time
