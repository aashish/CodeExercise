require_relative 'chess/square'
require_relative 'chess/rook'
require_relative 'chess/queen'
require_relative 'chess/knight'

class Chess
  attr_reader :piece, :position
  PIECES = %w[Queen Rook Knight]
  ROWS = %w[a b c d e f g h]
  COLUMNS = 1.upto(8).map(&:to_s)

  def initialize(piece, position)
    @piece = piece
    @position = position
    valid_piece?
    valid_position?
  end

  def valid_piece?
    unless PIECES.include?(@piece)
      puts 'Invalid Piece'
      exit
    end
  end

  def valid_position?
    unless @position.size == 2 && ROWS.include?(@position[0]) && COLUMNS.include?(@position[1])
      puts 'Invalid Position'
      exit
    end
  end

  def position_x
    ROWS.index(@position[0])
  end

  def position_y
    COLUMNS.index(@position[1])
  end

  def select_piece
    case @piece
    when 'Rook'
      Rook.new
    when 'Knight'
      Knight.new
    when  'Queen'
      Queen.new
    else
      exit
    end
  end

  def generate_moves
    piece = select_piece
    from = Square.new(position_x, position_y)
    
    moves = piece.possible_moves?(from)
    moves.map! { |move|
      ROWS[move[0]] + COLUMNS[move[1]]
    }

    moves.join(', ')
  end
end




