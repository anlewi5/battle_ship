def print_instructions
  puts 'BATTLESHIP INSTRUCTIONS:'
  puts 'objective: sink enemy\'s ships.'
  puts 'setup: you and the computer place 2 ships each on your boards.
        one ship is two coordinates long and the other is three.
        each board is a 4x4 grid consisting of the numerical values 1-4 on the x-axis
        and the letter values A-D on the y-axis.'
  puts 'turn: on each turn the player fires a shot as a coordinate which will either
        hit or miss the enemy\'s ship.'
  puts 'end: the game ends when one of the player\'s has hits on all of their ship coordinates.
        the opposing player is the winner.'
end
