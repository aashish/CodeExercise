require_relative 'piece'

class Rook < Piece  
  def possible_moves?(from)
    in_directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    super from, in_directions
  end  
end