piece, position = nil

if ARGV[0] == '-piece' && ARGV[2] == '-position'
  piece = ARGV[1]
  position = ARGV[3]
else
  puts 'Invalid options'
  puts 'Example: '
  puts 'chessercise.rb -piece KNIGHT -position d2'
  exit
end
  
require_relative 'chess'

chess = Chess.new(piece, position)
p chess.generate_moves

