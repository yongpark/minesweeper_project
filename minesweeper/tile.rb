class Tile
  attr_reader :value, :hidden

  def initialize(value = nil)
    @value = value
    @hidden = true
  end

  def flip_tile
    @hidden = false
  end

end
