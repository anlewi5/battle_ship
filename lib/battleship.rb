require './lib/referee'

referee = Referee.new

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
referee.place_ship
