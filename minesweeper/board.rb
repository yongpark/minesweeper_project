require_relative 'tile'

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(9) {Array.new(9)})
    @grid = grid
  end


  def [](pos)
   x, y = pos
   @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def bomb_pos
    result = []
    until result.length == 10
      x = rand(9)
      y = rand(9)
      result << [x, y] unless result.include?([x, y])
    end
    result
  end

  def populate_tiles
    bomb_pos.each do |pos|
      self[pos] = Tile.new("bomb")
    end
     @grid.each do |row|
       row.each do |tile|
        tile = Tile.new
       end
     end
  end

  def reveal(pos)
    if self[pos] == true
      self[pos].flip_tile
    else
      raise "Already flipped over. :<"
    end
  end

  def flag(pos)
  end

  def render
    top_line = "  " + (0..8).to_a.map { |el| el.to_s + "  " }.join
    body = top_line + "\n"
    @grid.each_with_index do |row, i|
      current_str = "#{i}|"
      row.each do |el|
        current_str << " 🀄 " if el.value.nil?
        if el.value == "bomb" && !el.hidden
          current_str << " 💣 "
        else
          current_str << " 🀄 "
        end
      body << current_str + "\n"
    end
    puts body
  end
end

board = Board.new
board.grid
board.bomb_pos
board.populate_tiles
board.render
