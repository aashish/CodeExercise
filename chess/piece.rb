class Piece
  def possible_moves?(from, in_directions, max_steps = 8)
    moves = []

    in_directions.each do |dx, dy|
      to = Square.new from.x + dx, from.y + dy
      steps = 0
      while (steps != max_steps) && to.inside_the_board?
        moves << to.to_a
        steps += 1
        to = Square.new to.x + dx, to.y + dy
      end
    end
    moves
  end
end
