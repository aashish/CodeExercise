require_relative 'chess/square'
require_relative 'chess/rook'
require_relative 'chess/queen'
require_relative 'chess/knight'

class Chess
  attr_reader :piece, :position
  PIECES = %w[Queen Rook Knight].freeze
  ROWS = %w[a b c d e f g h].freeze
  COLUMNS = 1.upto(8).map(&:to_s).freeze
  WHITE = 'white'.freeze
  BLACK = 'black'.freeze

  def initialize(piece, position, target = nil)
    @piece = piece
    @position = position
    @target = target
    valid_piece?
    valid_position?
    valid_target? if target
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

  def valid_target?
    unless WHITE == @target || BLACK == @target
      puts 'Invalid Target'
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
    when 'Queen'
      Queen.new
    else
      exit
    end
  end

  def generate_raw_moves
    piece = select_piece
    from = Square.new(position_x, position_y)
    piece.possible_moves?(from)
  end

  def generate_moves
    moves = generate_raw_moves
    moves.map! do |move|
      ROWS[move[0]] + COLUMNS[move[1]]
    end

    moves.join(', ')
  end

  def minimum_set_of_moves
    from = Square.new(position_x, position_y)
    tile = most_distant_tile
    to = Square.new(tile[0], tile[1])
    select_piece.path(from, to)
  end

  def generate_random_opposing_pieces(count)
    opposing_pieces_position = []

    count.times do
      begin
       position = [rand(0..7), rand(0..7)]
     end while position == [position_x, position_y]
      opposing_pieces_position << position
    end
    puts "8 Random opposing pieces: #{opposing_pieces_position}"

    opposing_pieces_position
  end

  def most_distant_tile
    distance = 0
    max_distant_title = nil
    generate_random_opposing_pieces(8).each do |to|
      d = Math.sqrt(((position_x - to[0]).abs**2) + ((position_y - to[1]).abs**2))
      if d >= distance
        max_distant_title = to
        distance = d
      end
    end

    puts "Most distant tile: #{max_distant_title}"
    max_distant_title
  end

  def run
    # Output for code exercise 1
    p generate_moves

    if @target
      puts ''
      # Ouput for code exercise 2
      target = minimum_set_of_moves
      puts "You made it in #{target.count - 1} steps!"
      puts target.to_s
      puts ''
    end
  end
end
