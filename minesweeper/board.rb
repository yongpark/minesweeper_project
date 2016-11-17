class Board
  attr_accessor :grid

  def initialize(grid = Array.new(9) {Array.new(9)})
    @grid = grid
  end

  def populate
  end

  def reveal(pos)
  end

  def flag(pos)
  end

  def render

  end

end

board = Board.new
p board.grid
