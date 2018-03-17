require_relative '../chess/square'
require_relative '../chess/piece'
require_relative '../chess/queen'
require_relative '../chess/knight'
require_relative '../chess/rook'

describe 'Square' do
  let(:square1) { make_square 0, 0 }
  let(:square2) { make_square 7, 7 }
  let(:square3) { make_square 0, 0 }

  it 'can be converted to an array' do
    expect(square1.to_a).to eq [0, 0]
  end

  it 'is false if coordinates differ' do
    expect(square1 == square2).to eq false
  end

  it 'is true if coordinates are the same' do
    expect(square1.to_a == square3.to_a).to eq true
  end

  it 'is true if square is out of the chess board' do
    square = make_square(-1, 8)
    square.out_of_the_board?.should be true
  end
end

describe 'Piece' do
  it 'finds possible moves in a given direction' do
    square = make_square(3, 6)
    piece = make_piece
    # [[4, 6], [5, 6], [6, 6], [7, 6]]
    expect(piece.possible_moves?(square, [[1, 0]])).to include([5, 6])
    expect(piece.possible_moves?(square, [[1, 0]])).not_to include([5, 7])
  end
end

describe 'Queen' do
  it 'finds possible valid moves' do
    from = make_square(3, 7)
    queen = make_queen
    expect(queen.possible_moves?(from)).to include([7, 3])
    expect(queen.possible_moves?(from)).not_to include([7, 6])
  end
end

describe 'Knight' do
  it 'finds possible valid moves' do
    from = make_square(1, 0)
    knight = make_knight
    expect(knight.possible_moves?(from)).to include([3, 1])
    expect(knight.possible_moves?(from)).not_to include([7, 6])
  end
end

describe 'Rook' do
  it 'finds possible valid moves' do
    from = make_square(3, 7)
    rook = make_rook
    expect(rook.possible_moves?(from)).to include([1, 7])
    expect(rook.possible_moves?(from)).not_to include([7, 6])
  end
end

def make_square(*args)
  Square.new(*args)
end

def make_piece(*args)
  Piece.new(*args)
end

def make_queen(*args)
  Queen.new(*args)
end

def make_knight
  Knight.new
end

def make_rook
  Rook.new
end
