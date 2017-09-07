require './lib/referee'

referee = Referee.new

start_time = Time.now
referee.run_setup
referee.run_shot_sequence
puts "Total time: #{Time.now - start_time}"
