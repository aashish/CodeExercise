class Square
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def out_of_the_board?
    [x, y].any? { |coordinate| coordinate < 0 or coordinate > 7 }
  end

  def inside_the_board?
    not out_of_the_board?
  end

  def to_a
    [x, y]
  end  
end